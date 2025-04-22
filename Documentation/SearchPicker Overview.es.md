# SearchPicker

## Overview

With the SearchPicker widget, you can easily create standard search areas, similar to those found in browsers or tool bars. The appearance of the area depends on the platform.

**Windows:**  
![Windows](images/pict308433.en.png)  
**Mac OS:**  
![Mac OS](images/pict308435.en.png)

The text displayed by default in the area can be controlled by programming, using the [SearchPicker SET HELP TEXT](Methods/SearchPicker%20SET%20HELP%20TEXT.md) component method.

### Functioning

Besides its appearance, a SearchPicker search area is characterized by the following elements: grayed out text, an entry area, and a deletion icon.

- **Entry area:** The user enters the value to be searched for. This value is automatically and dynamically assigned to the variable that you have bound with the area in the Property list ("Variable Name" property). You use this variable to supply the value searched for to the search method.
- **Grayed out text:** An aid indicating the field(s) where the search will be carried out to the user. It disappears as soon as the area has the focus. This text can be set via the [SearchPicker SET HELP TEXT](Methods/SearchPicker%20SET%20HELP%20TEXT.md) command.
- **Deletion button:** Used to erase the contents of the area. Its functioning is automatic.

During execution, you can launch your search method by clicking on a custom button in the form or via a form event. The area generates more particularly the **On Data Change** and **On Losing Focus** events. You can provide a dynamic search that is reevaluated each time the user enters another character by calling the search method in the **On Data Change** event.

### Creation

You can insert a SearchPicker area in a form in two ways:

1. By inserting a "SearchPicker" area from the preconfigured object library of 4D ("Entry areas" theme).
2. By creating a subform area and assigning the **SearchPicker** detail form to it.  
   ![Subform](images/pict308455.en.png)

Then specify the name of the variable bound with the subform ("Variable Name" property in the Property list). When the form is executed, this variable will automatically contain the value searched for by the user. You can then pass this value to your custom search method.
