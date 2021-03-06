# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
#from django.contrib.auth.models import User
from django.utils import timezone
from django.conf import settings
from django.contrib.sites.models import Site
from django import forms
#from settings import base 
# Two-sequence containing the different possible
# states of a todo item
STATUS_CHOICES = (
    # ('1', 'Todo'),
    # ('2', 'Doing'),
    # ('3', 'Done')
    ('Todo', 'Todo'),
    ('Doing', 'Doing'),
    ('Done', 'Done'),
)
TYPE_CHOICES = ( 
    ('Bug', 'Bug'),
    ('New Feature', 'New feature'),
)
 
 
class Todo(models.Model):
    """
    Todo model.
 
    Contains the `user`, `title`, `description`, `status` and `updated` fields
    for a Todo item
    """
    user = models.ForeignKey(settings.AUTH_USER_MODEL, default=1,on_delete=models.CASCADE)
    #user = models.ForeignKey(User, default=1)
    Type = models.CharField(max_length=5, choices=TYPE_CHOICES,)
    title = models.CharField(max_length=100, null=False)
    description = models.CharField(max_length=255, null=False)
    #description = forms.CharField(label='Description', max_length=100, max_ length=255, null=False)
    status = models.CharField(max_length=5, choices=STATUS_CHOICES, null=False)
    updated = models.DateTimeField(default=timezone.now)
 
    def __unicode__(self):
        return self.title