"""
URL configuration for myelibrary project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static


from myelibrary_app import views

urlpatterns = [
    path('admin/', admin.site.urls),

    path('students/', views.StudentListView.as_view(), name='Studentlist'),
    path('students/add', views.add_student, name='StudentAdd'),
    path('students/student-list/<pk>', views.StudentUpdateView.as_view(), name="StudentUpdate"),
    path('students/delete_student/<int:id>', views.delete_student, name='StudentDelete'),

     path('books/', views.BookListView.as_view(), name='Booklist'),
     path('books/add', views.add_book, name='BookAdd'),
     path('books/book-edit/<pk>', views.BookUpdateView.as_view(), name="BookUpdate"),
     path('books/delete_book/<int:id>', views.delete_book, name='BookDelete'),

     path('borrows/', views.BorrowListView.as_view(), name='Borrowlist'),
     path('borrows/add', views.add_borrow, name='BorrowAdd'),
     path('borrows/borrow-edit/<pk>', views.BorrowUpdateView.as_view(), name="BorrowUpdate"),
     path('borrows/delete_borrow/<int:id>', views.delete_borrow, name='BorrowDelete'),
    
    path('home/', views.MyTopCharts.as_view(), name='Home'),

    path('report/', views.ReportView.as_view(), name='report'),

    path('', views.login, name='login'),
    
]
if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
