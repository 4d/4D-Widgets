# 4D Widgets

4D widgets are functionalities provided as components that can be accessed from the Form editor and/or the preconfigured object library. These widgets are compound objects with predefined characteristics. They provide access to standard functions and are very simple to implement.

Three widgets are available:

- [SearchPicker](Documentation/SearchPicker.md): search area with standard appearance.
- [DatePicker](Documentation/DatePicker.md): date selector.
- [TimePicker](Documentation/TimePicker.md): time selector.

 > These widgets can be used with or without programming. You can simply integrate them into your forms and use their default properties.
 > <br>If you want to be able to control and configure them in a more customized manner, you can make use of specific project methods, called "Component methods," which are listed by component.

![](Documentation/images/pict307590.en.png)

This documentation covers each widget and describes the syntax of the component methods associated with it.

## Adding a widget  

 There are two ways to insert a widget area in a form:

- Using the object library
- Using a subform

### Via the object library  

To insert a widget using the object library:

1. Select the **Object Library** command from the **Design** menu.  
    The Object Library window appears.
2. Select **Widgets** in the Category menu.  
    All the available widgets are listed:  
    ![](Documentation/images/pict307739.en.png)
3. Insert the desired widget into your form by dragging and dropping it.  
    You can then configure it via the properties of the inserted object or via its object method.

### Via a subform  

To create a widget via a subform type object:

1. In the Form editor, add a subform object.  
    This point is described in the 4D _Design Reference_ manual.
2. In the Property List, click on the "Detail Form" menu to scroll through the list of forms that can be used. This list includes the widgets.  
    ![](Documentation/images/pict307757.en.png)
3. Select the widget to be inserted.  
    You can then configure it via the object properties or the object method of the subform.

## Initializing widgets on page 2 and following  

 Widgets are based on 4D subforms and are therefore subject to the same operating principles. You should pay particular attention to their initialization.

For optimization purposes, subform objects are instantiated by 4D only when the subform is displayed. This means that method calls via [EXECUTE METHOD IN SUBFORM](https://developer.4d.com/docs/commands/execute-method-in-subform) or access to dynamic objects in subforms are not possible until the subform is displayed on the current page.

When you place widgets on form pages other than page 1, it is not possible to call an initialization method (such as [TimePicker SET STEP](Documentation/Methods/TimePicker%20SET%20STEP.md)) in the On Load form event, because at the time of its execution the widget will not be instantiated.

To handle this case, widget areas return a specific event with a value of -1 to indicate that they are loaded and ready for use. This event must be tested at the object method level of the widget itself, in the same way as the On Data Change, On Load etc. Therefore when the widget is located on a form page other than page 1, it's necessary to write:

```4d
 If(FORM Event=-1) // the widget is instantiated and can be initialized  
    TimePicker SET STEP("myTimePicker";? 00:10:00?) // example  
 End if
```

rather than:

```4d
 If(FORM Event code=On Load) // only works if the widget is on page 1  
    TimePicker SET STEP("myTimePicker";? 00:10:00?)  
 End if
```
