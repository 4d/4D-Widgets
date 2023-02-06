# 🧩 TimePicker and TimeEntry  

The TimePicker widget provides easy-to-use objects that you can use to make the most of any fields that require times to be entered or displayed. It can be used in the following forms:

* Single or double pop up menus:  
    ![](https://doc.4d.com/4Dv19/picture/308493/pict308493.en.png) ![](https://doc.4d.com/4Dv19/picture/308495/pict308495.en.png)

* Time entry areas in the "hh:mm:ss" format associated with a numeric stepper that can be used to increase or decrease the value of the hours, minutes or seconds:  
    ![](https://doc.4d.com/4Dv19/picture/308497/pict308497.en.png)

* Clocks (_TimeDisplay_) or digital clocks (_TimeDisplayLCD_):  
    ![](https://doc.4d.com/4Dv19/picture/1239685/pict1239685.fr.png) ![](https://doc.4d.com/4Dv19/picture/1239687/pict1239687.fr.png)

In addition, each type of TimePicker can display the time in 12-hour (AM-PM) or 24-hour format.

 TimePicker object can be used without programming thanks to the mechanisms provided by the bound variable. However, if you want to customize the functioning of TimePicker objects, you can use the set of component methods that is provided.

## Creation and use  

You can insert a TimePicker area into a form in two ways:

* By inserting a "TimePicker" or "TimeEntry" object from the preconfigured object library of 4D.
* By creating a subform area and assigning the **TimePicker** or **TimeEntry** detail form of your choice to it.

Then specify the name of the variable bound to the subform ("Variable Name" property in the Property List). When the form is executed, this variable will automatically contain the time specified by the user. Conversely, if you modify the value of this variable by programming, it will automatically be shown in the subform. You can also choose not to name the variable in order to benefit from the dynamic variable mechanism.

#### About clocks (new in v14)  

Clock widgets are drawn in SVG, and therefore have a vector path allowing deformations in Application mode (in Design mode, their size is fixed):

![](https://doc.4d.com/4Dv19/picture/1239707/pict1239707.fr.png)

Note that:

* For a standard clock, the second hand can be displayed or hidden using the [TimePicker DISPLAY SECOND HAND](TimePicker%20DISPLAY%20SECOND%20HAND.md) method.
* A standard clock automatically changes to "day mode" or "night mode" depending on the time:  
    ![](https://doc.4d.com/4Dv19/picture/1239740/pict1239740.fr.png)  
    The time ranges are 8:00:00 -> 19:59:59 = Day, 20:00 -> 07:59:59 = Night.
* The "digital clock" widget is transparent and has no background, so it can be placed on top of colored objects in order to vary its appearance:  
    ![](https://doc.4d.com/4Dv19/picture/1239718/pict1239718.fr.png)  
    There are several display options for this widget that are available through component methods, which are prefixed by "TimePicker LCD".

**Note:** Developers can displace this clock drawing and substitute their own creations by replacing the "clock.svg" file found at the first level of the "Resources" folder.

## Displaying the current time or a static time  

Clocks can either display the current time dynamically, or show a static time.

* To display the current time, associate an **Integer** variable to the subform object of the widget (default operation). In this case, the widget automatically displays the current time and operates like a clock.  
    You can apply an offset to the displayed time: the value of the number variable indicates the offset in seconds. For example, 3600 = advancing the clock one hour, -1800 = turning the clock back 30 minutes, etc.

* To display a static time, associate a **Time** variable to the subform object of the widget (by means of the [C_TIME](https://developer.4d.com/docs/Concepts/time) command or the Property List). The clock then displays the value of the this variable.

For example, we want the clock to show 10:10:30:

```4d
 C_TIME(myvar) // myvar is the name of the widget’s variable  
 myvar:=?10:10:30?
```
