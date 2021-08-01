import 'dart:html';

void main(List<String> args) {
  DivElement divElement = new DivElement();
  divElement.className = 'mainDiv';
  //the header element to add the title
  Element header = new Element.tag('h2');
  //to add the text to the header and any other element takes text (e.g button ...)
  header.text = "To do App";
  header.style.backgroundColor = 'white';
  //adding input element
  InputElement inputElement = new InputElement();
  //adding button
  ButtonElement buttonElement = new ButtonElement();
  buttonElement.text = 'add';
  // to change the state or to handle an event
  //div to wrap to-dos
  DivElement todosContainer = DivElement();
  todosContainer.id = 'todosContainer';
  //adding element on the todo list after clicking on the button which is the text on the input
  buttonElement.onClick.listen((event) {
    if (inputElement.value != '') {
      var todoItem = new Element.html("<div>${inputElement.value}</div>");
      todoItem.className = 'item';
      todosContainer.children.add(todoItem);
      inputElement.value = '';
      //you can delete a to-do by clicking on it as :
      todoItem.onClick.listen((event) {
        todosContainer.children.remove(todoItem);
      });
    }
  });

  divElement.children.add(header);
  divElement.children.add(inputElement);
  divElement.children.add(buttonElement);
  divElement.children.add(todosContainer);

  document.body.children.add(divElement);
}
