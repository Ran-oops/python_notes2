from django.db import models

# Create your models here.
class Job51(models.Model):
    url_id=models.CharField(max_length=255,primary_key=True)
    date_time = models.CharField(max_length=255)
    salary = models.CharField(max_length=255)
    title=models.CharField(max_length=255)
    company = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    detail = models.TextField()

    class Meta:
        db_table='jobs_job51'

