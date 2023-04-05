




### Q11. Where and how should be class attributes created?
Ans. Class attributes are the variables defined directly in the class that are shared by all objects of the class. Such attributes are defined inside class and outside __init__  usually at the top, for legibility. 
To define a class attribute, you place it outside of the __init__() method. One can access the class attribute via instances of the class or via the class name.
 Class attribute
class Student:

     ```count = 0
        def __init__(self):
         Student.count += 1 ```

The count variable acts as a class attribute. Class attributes remain the same for every object.
