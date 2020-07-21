# Flutter Provider

 1. Flutter provider is basically used to pass the data to child class widget and also notify to when vlue changes.
 
 
# How to use Flutter provider
 Just consider a product app and wen need to pass all product list through out the app and modify specifice ui element then you need to render whole ui 
 There is two method that is 
 1.create a constructor and passthrouhg to child object then next child object.
 2. Create a Provider and Pass to next class then next will next to next child class. and widget.

1. Add dependancy to your project 
   provider: ^3.0.0 
2. Add provider to your parent widget.

## Syntax
```
 ChangeNotifierProvider(
      create: (ctx) =>
          ProductList class(), // when you are using creating new object instance the user provider.create
      child: ParentClass // allocation
```
## Read provider Value from child widget
   Read proivide value from child calss using 
   ```
    final ProductList productList = Provider.of<ProductList>(context);  // where product list pass through provider
    if you want to donot notify the object then user 
    final ProductList productList = Provider.of<ProductList>(context,listen: false);  
   ```
## Consumer
  Consumner also one type of widget where it read the value of the provider.The best ting of the consumer is that it will render whole wifget again .It will render   specific element.
  
## Syntax
     ```
     Consumer<Dynamic> (
     builder:(ctx, DynamicObject, child) =>Your wudget where Dynamic is the specific object that pass through from parent class to child calss.
     # Example
     Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: item.isFavorite ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  item.setFavorite();
                }),
     ```
## How Provider Lister if there is any chages to object 
   ## Syntax
   ```
   Class Product with ChangeNotifier {
   void addObject(){
   notifyListeners(); All the child class will notify when the add method call
   }
   ```
## What is the difference between Provider.Value and Provider.Create or when user provider value and Provider
   if the object already allocated then use ChangeNotifierProvider.value or if you want to use allocted object at the create time then use ChageNotifierProvider(create:(cxt)=> allocated object
   ## Syntax
      ```
      ChangeNotifierProvider(create:(ctx) => AllocatedObject();
      ChangeNotifierProvider.Value(value: ReferenceOf the object
      ```
## MultiProvider 
 You can use multiplrovide through out the pogram 
   ## Syntax
      ```
   Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ShoppingList(),
        ),
      ],
        ```   

 You will get the value through out the child class

## Delete Cell Using swipe function
## Widget name : Dismissible
## Syntax
          ```
       Dismissible(
      key: ValueKey(item.product.id), // key which item will delete
      direction: DismissDirection.endToStart, // right to left
      onDismissed: (direction) { // function execute while delete the item
      },
      background: Container(
        color: Colors.blueAccent,
        child: Icon(
          Icons.delete,
          color: Colors.black,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.only(left: 10, right: 5, top: 2),
      )
      ```




     
  
    
  
   
