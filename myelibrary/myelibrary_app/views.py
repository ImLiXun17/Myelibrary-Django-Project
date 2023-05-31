from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader
from django.urls import reverse
from django.contrib import messages
from datetime import datetime, timedelta
from django.db.models import F
from django.core.paginator import Paginator
from django.db.models import Q
from django.db.models import Sum
import calendar
from django.db.models.functions import ExtractMonth
from django.contrib.auth.decorators import login_required


from django.views.generic.list import ListView, BaseListView
from django.views.generic.edit import UpdateView
from myelibrary_app.models import Student, Book, Borrow
from myelibrary_app.forms import StudentForm
from myelibrary_app.forms import BookForm
from myelibrary_app.forms import BorrowForm
from myelibrary_app.models import College
from django.views.generic import TemplateView
from django.db.models import Count
from .models import Borrow, Book, College, Student
import json
from django.contrib.auth.models import User, auth

# Create your views here.

from django.db.models import Q


class StudentListView(ListView):
    model = Student
    template_name = 'student.html'
    context_object_name = 'students'
    paginate_by = 10

    def get_queryset(self):
        search = self.request.GET.get('search', '')
        queryset = super().get_queryset().order_by('student_name')

        if search:
            queryset = queryset.filter(
                Q(sid__icontains=search) |
                Q(student_name__icontains=search) |
                Q(college_id__college_name__icontains=search) |
                Q(address__icontains=search)
            )

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['search'] = self.request.GET.get('search', '')
        return context

    

class StudentUpdateView(UpdateView):
    model = Student
    form_class = StudentForm
    context_object_name = 'student'
    template_name = 'student-edit.html'
    success_url = "/students"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

    def form_valid(self, form):
      messages.success(self.request, "Student was updated successfully!")
      super().form_valid(form)
      return HttpResponseRedirect(self.get_success_url()) 


class BookListView(ListView):
    model = Book
    template_name = 'book.html'
    context_object_name = 'books'
    paginate_by = 10

    def get_queryset(self):
        search = self.request.GET.get('search', '')
        queryset = super().get_queryset().order_by('book_name')

        if search:
            queryset = queryset.filter(
                Q(book_isbn__icontains=search) |
                Q(book_name__icontains=search) |
                Q(book_author__icontains=search) |
                Q(year_published__icontains=search)
            )

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['search'] = self.request.GET.get('search', '')
        return context

    


class BookUpdateView(UpdateView):
    model = Book
    form_class = BookForm
    context_object_name = 'book'
    template_name = 'book-edit.html'
    success_url = "/books"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

    def form_valid(self, form):
      messages.success(self.request, "Book was updated successfully!")
      super().form_valid(form)
      return HttpResponseRedirect(self.get_success_url())


class BorrowListView(ListView):
    model = Borrow
    template_name = 'borrow.html'
    context_object_name = 'borrows'
    paginate_by = 10

    def get_queryset(self):
        search = self.request.GET.get('search', '')
        queryset = super().get_queryset().order_by('-time_borrow')

        if search:
            queryset = queryset.filter(
                Q(student_id__student_name__icontains=search) |
                Q(book_isbn__book_name__icontains=search) |
                Q(coll_id__college_name__icontains=search)
            )

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['search'] = self.request.GET.get('search', '')
        return context





class BorrowUpdateView(UpdateView):
    model = Borrow
    form_class = BorrowForm
    context_object_name = 'borrow'
    template_name = 'borrow-edit.html'
    success_url = "/borrows"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

    def form_valid(self, form):
        # Calculate the time difference between time_borrow and time_return
        time_borrow = self.object.time_borrow
        time_return = form.cleaned_data['time_return']
        time_difference = time_return - time_borrow

        hours_exceeded = max(time_difference.total_seconds() / 3600 - 24, 0)

        fines = hours_exceeded * 20

      
        form.instance.fines = fines


        response = super().form_valid(form)

        book = self.object.book_isbn

        book.quantity += 1
        book.save()

        messages.success(self.request, "Borrow was updated successfully!")

        return response


class MyTopCharts(TemplateView):
    template_name = 'home.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        # Query the top 10 most borrowed books
        top_borrowed_books = Borrow.objects.values('book_isbn__book_name', 'book_isbn') \
            .annotate(borrow_count=Count('student_id')) \
            .order_by('-borrow_count')[:10]

        book_names = [book['book_isbn__book_name'] for book in top_borrowed_books]
        borrow_counts = [book['borrow_count'] for book in top_borrowed_books]

        context['label_chart'] = json.dumps(book_names)
        context['count_book'] = json.dumps(borrow_counts)

        # Query the colleges and count the number of students in each college
        college_counts = Borrow.objects.values('coll_id__college_name') \
            .annotate(total_count=Count('student_id')) \
            .order_by('-total_count')[:9]

        college_names = [college['coll_id__college_name'] for college in college_counts]
        student_counts = [college['total_count'] for college in college_counts]

        context['college_chart_labels'] = json.dumps(college_names)
        context['college_chart_counts'] = json.dumps(student_counts)

            # Query the colleges and count the number of students in each college
        college_counts = Student.objects.values('college_id__college_name') \
                .annotate(total_count=Count('sid')) \
                .order_by('-total_count')

        count_mycollege = [college['total_count'] for college in college_counts]
        lab_mychart = [college['college_id__college_name'] for college in college_counts]

        context['count_mycollege'] = json.dumps(count_mycollege)
        context['lab_mychart'] = json.dumps(lab_mychart)


        # Query the students and calculate the total fines
        student_fines = Borrow.objects.values('student_id__student_name') \
            .annotate(total_fines=Sum('fines')) \
            .order_by('-total_fines')[:10]

        count_fines = [student['total_fines'] for student in student_fines]
        fines_chart = [student['student_id__student_name'] for student in student_fines]

        context['count_fines'] = json.dumps(count_fines)
        context['fines_chart'] = json.dumps(fines_chart)

        
      # Retrieve the data
        borrow_data = Borrow.objects.exclude(time_borrow__isnull=True).values('time_borrow__month') \
            .annotate(total_students=Count('student_id', distinct=True)) \
            .order_by('time_borrow__month')

        # Filter out None values and initialize arrays for the chart data
        count_students = []
        student_chart = []

        for data in borrow_data:
            month_number = data['time_borrow__month']
            if month_number is not None:
                count_students.append(data['total_students'])
                month_name = calendar.month_name[month_number]
                student_chart.append(month_name)

        print("count_students:", count_students)
        print("student_chart:", student_chart)

        context['count_students'] = json.dumps(count_students)
        context['student_chart'] = json.dumps(student_chart)

        
        # Fetch the data
        results = Student.objects.select_related('college_id').order_by('-date_add')[:5]

        context['results'] = results

        return context

class ReportView(BaseListView):
    def get(self, request, *args, **kwargs):
            
        total_borrow_132 = Borrow.objects.filter(coll_id__id=132).values('student_id').distinct().count()
        total_students = Student.objects.count()

        percentage_132 = (total_borrow_132 / total_students) * 100
        percentage_formatted_132 = '{:.2f}'.format(percentage_132)

        total_borrow_133 = Borrow.objects.filter(coll_id__id=133).values('student_id').distinct().count()
        percentage_133 = (total_borrow_133 / total_students) * 100
        percentage_formatted_133 = '{:.2f}'.format(percentage_133)

        total_borrow_134 = Borrow.objects.filter(coll_id__id=134).values('student_id').distinct().count()
        percentage_134 = (total_borrow_134 / total_students) * 100
        percentage_formatted_134 = '{:.2f}'.format(percentage_134)

        total_borrow_135 = Borrow.objects.filter(coll_id__id=135).values('student_id').distinct().count()
        percentage_135 = (total_borrow_135 / total_students) * 100
        percentage_formatted_135 = '{:.2f}'.format(percentage_135)

        total_borrow_136 = Borrow.objects.filter(coll_id__id=136).values('student_id').distinct().count()
        percentage_136 = (total_borrow_136 / total_students) * 100
        percentage_formatted_136 = '{:.2f}'.format(percentage_136)

        total_borrow_137 = Borrow.objects.filter(coll_id__id=137).values('student_id').distinct().count()
        percentage_137 = (total_borrow_137 / total_students) * 100
        percentage_formatted_137 = '{:.2f}'.format(percentage_137)

        total_borrow_138 = Borrow.objects.filter(coll_id__id=138).values('student_id').distinct().count()
        percentage_138 = (total_borrow_138 / total_students) * 100
        percentage_formatted_138 = '{:.2f}'.format(percentage_138)

        total_borrow_139 = Borrow.objects.filter(coll_id__id=139).values('student_id').distinct().count()
        percentage_139 = (total_borrow_139 / total_students) * 100
        percentage_formatted_139 = '{:.2f}'.format(percentage_139)

        total_borrow_140 = Borrow.objects.filter(coll_id__id=140).values('student_id').distinct().count()
        percentage_140 = (total_borrow_140 / total_students) * 100
        percentage_formatted_140 = '{:.2f}'.format(percentage_140)

        context = {
            'percentage132': percentage_formatted_132,
            'percentage133': percentage_formatted_133,
            'percentage134': percentage_formatted_134,
            'percentage135': percentage_formatted_135,
            'percentage136': percentage_formatted_136,
            'percentage137': percentage_formatted_137,
            'percentage138': percentage_formatted_138,
            'percentage139': percentage_formatted_139,
            'percentage140': percentage_formatted_140,
        }

        return render(request, 'report.html', context)


   
# ADD FUNCTIONS
def add_student(request):
    if request.method == "POST":
        form = StudentForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'New student added successfully!')
            return redirect('Studentlist')
        else:
            messages.error(request, 'Please complete the required fields.')
            # Render the form with error messages
            return render(request, 'student-add.html', {'form': form})
    else:
        form = StudentForm()
        colleges = College.objects.all()
        context = {'form': form, 'colleges': colleges}
        return render(request, 'student-add.html', context)


def add_book(request):
    if request.method == "POST":
        form = BookForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'New Book added successfully!')
            return redirect('Booklist')
        else:
            messages.error(request, 'Please complete the required fields.')
            # Render the form with error messages
            return render(request, 'book-add.html', {'form': form})
    else:
        form = BookForm()
        return render(request, 'book-add.html',  {'form': form})


from django.contrib import messages

def add_borrow(request):
    if request.method == "POST":
        form = BorrowForm(request.POST)
        if form.is_valid():
            borrow = form.save(commit=False)

            book = form.cleaned_data['book_isbn']
            if book.quantity > 0:
                borrow.book = book
                borrow.save()
                book.quantity -= 1
                book.save()
                messages.success(request, 'New borrow added successfully!')
                return redirect('Borrowlist')
            else:
                messages.error(request, 'No books available.')
                form.add_error('book_isbn', 'No books available.')  # Add a form error for book_isbn field
                return render(request, 'borrow-add.html', {'form': form})
        else:
            messages.error(request, 'Please complete the required fields.')
            return render(request, 'borrow-add.html', {'form': form})
    else:
        form = BorrowForm()
        form.fields['student_id'].queryset = Student.objects.order_by('student_name')
        form.fields['book_isbn'].queryset = Book.objects.order_by('book_name')
        colleges = College.objects.all()
        students = Student.objects.all()
        books = Book.objects.all()
        context = {'form': form, 'colleges': colleges, 'students': students, 'books': books}
        return render(request, 'borrow-add.html', context)




#DELETE FUNCTION
def delete_student(request, id):
    student = Student.objects.get(sid=id)
    student.delete()
    messages.success(request, 'Student deleted successfully!')
    return HttpResponseRedirect(reverse('Studentlist'))

def delete_book(request, id):
    book = Book.objects.get(bid=id)  
    book.delete()
    messages.success(request, 'Book deleted successfully!')
    return redirect('Booklist')

def delete_borrow(request, id):
    borrow = Borrow.objects.get(borrow_id=id)  
    borrow.delete()
    messages.success(request, 'Borrow deleted successfully!')
    return redirect('Borrowlist')

#Login Function


def login(request, template_name='login.html'):
    error_message = None

    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')

        user = auth.authenticate(username=email, password=password)

        if user is not None:
            auth.login(request, user)
            return redirect('Home')  # Replace 'Home' with the appropriate URL name for the home page
        else:
            error_message = 'Incorrect password or email'

    context = {
        'error_message': error_message,
    }

    return render(request, template_name, context)