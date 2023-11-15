# walleti

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)


```dart
class Todo {
  String description;
  bool? completed;
  Todo({required this.description, this.completed});
}

@riverpod
class TodoList extends _$TodoList {
  @override
  Future<List<Todo>> build() async {
    // The logic we previously had in our FutureProvider is now in the build method.
    return [
      Todo(description: 'Learn Flutter', completed: true),
      Todo(description: 'Learn Riverpod'),
    ];
  }

  Future<void> addTodo(Todo todo) async {
    // We can then manually update the local cache. For this, we'll need to
    // obtain the previous state.
    // Caution: The previous state may still be loading or in error state.
    // A graceful way of handling this would be to read `this.future` instead
    // of `this.state`, which would enable awaiting the loading state, and
    // throw an error if the state is in error state.
    final previousState = await future;

    // We can then update the state, by creating a new state object.
    // This will notify all listeners.
    state = AsyncData([...previousState, todo]);
  }
}
```
