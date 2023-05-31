from django.contrib import admin
from .models import Student
from .models import College
from .models import Book
from .models import Borrow
from .models import Admin

admin.site.register(Student)
admin.site.register(College)
admin.site.register(Book)
admin.site.register(Borrow)
admin.site.register(Admin)

