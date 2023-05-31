from django.forms import ModelForm
from .models import Student
from .models import Book
from .models import Borrow

class StudentForm(ModelForm):
    class Meta:
        model = Student
        fields = ("sid", "student_name", "corporate_email", "college_id", "address",)

class BookForm(ModelForm):
    class Meta:
        model = Book
        fields = ('bid', 'book_name', 'book_author', 'book_isbn', 'year_published', 'quantity',)

class BorrowForm(ModelForm):
    class Meta:
        model = Borrow
        fields = ('borrow_id', 'student_id', 'book_isbn', 'coll_id','time_borrow', 'time_return', 'fines','status',)