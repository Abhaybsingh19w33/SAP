# CSS- Cascading Style Sheets

To improve look and feel of application we use CSS, by applying them on  HTML Elements.

Syntax :- 
```
Selector{
    Characteristic: value;
    Characteristic: value;
    ------------------
}
```

- There are three ways of applying CSS 
    - External CSS File:- 
    ```
        <link href=”path” rel=”stylesheet”> 
    ```
    - At header level of HTML document 
    ```
        <style type="text/css">
            Selector{
                Characteristic: value;
                Characteristic: value;
                ------------------
            }
        </style>
    ```
    - Inline declaration at HTML Element : 
    ```
        style="characteristic:value"
    ```

- Types of selectors in CSS
    - Universal - This will apply through the page
    ```
    * {
        Characteristic: value;
    }
    ```
    - Type - will apply to specified types like input, labels
    ```
    label {

    }
    ```
    - ID - to ids
    - Class - to element with mentioned class
    - Descendant - we can apply style based on parent child relationship
    - Group - 

## CSS precedence

[Rules](https://www.codeguage.com/courses/css/style-precedence)
[website](https://medium.com/@saanstone/understanding-css-precedence-specificity-d8ca24712417)

For label case - 
Universal (1)
    then if an external css file (2)
        then if mentioned in style tag (3)

precedense 3 > 2 > 1