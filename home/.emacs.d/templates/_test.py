#!/usr/bin/env python3
# -*- coding:utf-8 -*-
# Author: %id%, Date: %date%
from unittest import TestCase
from nose.tools import ok_, eq_, raises


class TestClass(TestCase):
    def setUp(self):
        pass

    @raises(Exception)
    def test_exception(self):
        ok_(True)
        eq_(1+1, 2)
        raise Exception()

    def tearDown(self):
        pass
