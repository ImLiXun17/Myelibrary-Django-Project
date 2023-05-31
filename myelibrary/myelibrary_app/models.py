from django.db import models


class College(models.Model):
    id = models.IntegerField(primary_key=True)
    mycollege = [
        ('CAH', 'CAH'),
        ('CBA', 'CBA'),
        ('CCJE', 'CCJE'),
        ('CEAT', 'CEAT'),
        ('CHTM', 'CHTM'),
        ('CNHS', 'CNHS'),
        ('CS', 'CS'),
        ('CTE', 'CTE'),
        ('LHS', 'LHS'),
    ]
    college_name = models.CharField(max_length=10, choices=mycollege)
    class Meta:
        db_table = 'college'

    def __str__(self):
        return self.college_name

class Student(models.Model):
    sid = models.BigIntegerField(primary_key=True, db_column='sid')
    student_name = models.CharField(max_length=255)
    corporate_email = models.EmailField(unique=True)
    college_id = models.ForeignKey(College, on_delete=models.CASCADE)
    address = models.TextField()
    date_add = models.DateField(auto_now_add=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'student'

    def __str__(self):
        return self.student_name
    
class Book(models.Model):
    bid = models.AutoField(primary_key=True, db_column='bid')
    book_name = models.CharField(max_length=500)
    book_author = models.CharField(max_length=50)
    book_isbn = models.BigIntegerField()
    year_published = models.IntegerField()
    quantity = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'book'

    def __str__(self):
        return str(self.book_name)
    
class Borrow(models.Model):
    borrow_id = models.AutoField(primary_key=True, db_column='borrow_id')
    student_id = models.ForeignKey(Student, on_delete=models.CASCADE)
    coll_id = models.ForeignKey(College, on_delete=models.CASCADE)
    book_isbn = models.ForeignKey(Book, on_delete=models.CASCADE, db_column='book_isbn', to_field='bid')
    time_borrow = models.DateTimeField()
    time_return = models.DateTimeField(null=True, blank=True)
    fines = models.IntegerField()
    myaction = [
        ('Paid', 'Paid'),
        ('Not Paid', 'Not Paid'),    
    ]
    status = models.CharField(max_length=10, choices=myaction)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'borrow'

    def __str__(self):
        return str(self.student_id.student_name)
    
class Admin(models.Model):
    admin_id = models.AutoField(primary_key=True, db_column='admin_id')
    admin_username = models.CharField(max_length=50)
    admin_email = models.EmailField(unique=True)
    admin_password = models.CharField(max_length=50)

    class Meta:
        db_table = 'admin'

    def __str__(self):
        return str(self.admin_username)