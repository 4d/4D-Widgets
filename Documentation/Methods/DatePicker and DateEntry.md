# 🧩 DatePicker and DateEntry  

The DatePicker widget is an intuitive, easy-to-use object that you can use to make the most of any fields that require dates to be entered or simply represented. This widget is provided in two forms:

* **DatePicker Calendar**: This object can be used either in a subform, or as a pull-down calendar displayed by clicking a button.
* **DateEntry Area**: Date area associated with control buttons. This object can be only be used in a subform.

## DatePicker calendar  

A DatePicker calendar is an area displaying each month as a table of days. During execution, the user can scroll through the months of the calendar both forwards and backwards by clicking on the arrow buttons. They can also use the arrow keys of the keyboard.

![](https://doc.4d.com/4Dv19/picture/307767/pict307767.en.png)

When it is inserted into a subform, a DatePicker object can be used without programming thanks to the mechanism provided by the **bound variable**: you can work with the value of the variable bound with the subform object ("Variable Name" property in the Property List) in order to manage its display and entry.  
When the form is executed, this date variable automatically contains the date selected by the user. Conversely, if you modify the value of this variable by programming, it will be shown automatically in the subform.

However, if you want to customize the functioning of the DatePicker or display it as a pop-up menu, you must use the set of component methods that is provided.

### Use in a subform  

You can insert a DatePicker calendar into a form in two ways:

* By inserting a "Date Picker" object from the preconfigured object library of 4D
* By creating a subform area and assigning the detail form of the **DatePicker** to it.

You can manage this area without programming via the bound variable mechanism (see above).

### Use in a pop-up  

You can use a DatePicker calendar as a pop-up window. To do this, you can either:

* insert a "Pop up date" object from the preconfigured object library,
* create a subform and assign the **DateButton** detail form to it.  
    In both these cases, you can manage its display and entry by binding a date variable to the object.
* create an object that calls the [DatePicker Display Dialog](DatePicker%20Display%20Dialog.md "DatePicker Display Dialog") component method. This method returns the date selected by the user.

## DateEntry area  

A DateEntry type area facilitates the entry of a date in the form specified in the system preferences (for example DD/MM/YY).  
The area appears as a date type associated with buttons:

![](https://doc.4d.com/4Dv19/picture/307791/pict307791.en.png)

During execution, the buttons located to the right of the entry area are only displayed when the object has the focus. The user selects each element of the date (day, month or year) individually by clicking or hitting the Tab key and can scroll them using the numeric stepper or the arrow keys of the keyboard. The calendar icon to the right can be used to select a date from a DatePicker pop-up calendar.

A DateEntry object can be used without programming thanks to the mechanism provided by the bound variable (see the "DatePicker calendar" paragraph). However, if you want to customize the functioning, you can use the set of component methods that is provided. These methods are the same as those of the DatePicker object.

### Use in a subform  

You can insert a DateEntry area into a form in two ways:

* By inserting a "DateEntry area" object from the preconfigured object library of 4D.
* By creating a subform area and assign the **DateEntry** detail form to it.
