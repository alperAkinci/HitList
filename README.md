#Reminder Notes

Core Data by Tutorials By the raywenderlich.com

##Chapter 1 : Your First Core Data App 
####HitList App
A simple tableView with the list of names . Core data stores the name that you added in each session.

- ### Starting Notes
  - Core Data entity as a class “definition” and the managed object as an instance of that class.
  - NSManagedObject represents a single object stored in Core Data , NSManagedObject is a shape-shifter.
  - The only way Core Data provides to read the value is key- value coding, commonly referred to as KVC.
  - KVC is a mechanism in Cocoa and Cocoa Touch for accessing an object’s properties indirectly using strings to identify properties. In this case, KVC makes NSMangedObject behave more or less like a dictionary.
  - An entity is a class definition in Core Data. The classic example is an Employee or a Company. In a relational database, an entity corresponds to a table

- ### Saving Data
  - Before you can save or retrieve anything from your Core Data store, you first need to get your hands on an NSManagedObjectContext. You can think of a managed object context as an in-memory “scratchpad” for working with managed objects.
  - Think of saving a new managed object to Core Data as a two-step process: first, you insert a new managed object into a managed object context; then, you “commit” the changes in your managed object context to save it to disk.
  - This default managed object context lives as a property of the application delegate. To access it, you first get a reference to the app delegate.
  -NSManagedObject a “shape-shifter” class because it can represent any entity.
  - ***An entity description is the piece that links the entity definition from your data model with an instance of NSManagedObject at runtime.
  
Referance from Core Data by Tutorials book, available at http://www.raywenderlich.com.
