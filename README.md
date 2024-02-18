# Coffee-Machine-Interface

## Overview

This is a Qt Quick application designed to provide a user-friendly interface for selecting various types of coffee drinks. The app allows users to choose their favorite coffee, customize it according to their preferences, and view detailed descriptions of each selection.

## Features

- **Coffee Selection:** Users can choose from a variety of coffee types.
- **Customization:** Options to customize coffee strength, temperature, and size.
- **Favorites:** Users can save and access their favorite coffee selections.
- **Intuitive Navigation:** Easy-to-use navigation between different screens.

## Implementation Details

### Custom Coffee Component

- **Interactive Coffee Tiles:** Each coffee option in the GridView is represented by a custom `Coffee` component. This component combines an image (icon) and a text description, creating an engaging and informative selection tile.
  - **User Interaction:** The component is designed to emit a `coffeeSelected` signal when clicked, allowing the app to respond to user selections seamlessly.

### GridView and ListModel

- **Coffee Selection Grid:** The app features a `GridView` to display various coffee options. Each grid cell represents a different coffee type, such as Espresso, Americano, Cappuccino, etc.
  - **Dynamic Data Handling:** A `ListModel` is used to define the coffee types, where each `ListElement` contains the name and icon of the coffee, facilitating an adaptable and scalable coffee menu.

### Layout Design

- **Organized UI Layout:** The app's layout is meticulously designed using `Column` and `Row` elements to arrange the UI components in a structured and aesthetically pleasing manner.

### User Preferences and Customization

- **Temperature and Size Selection:** Utilizing `Sliders` and `RadioButtons`, the app offers users the ability to customize their coffee temperature and size, enhancing the personalization of the coffee experience.

### Canvas for Dynamic Graphics

- **Visual Enhancements and Animations:** In the Processing Screen of the app, a `Canvas` element is used for rendering custom graphics, enriching the user interface with visually pleasing elements.
  - **Dynamic Graphics Rendering:** The `Canvas` is designed to draw a background circle and a progress arc that animates over time. It calculates the center coordinates and radius of the circle and uses them to draw the circle and arc. The canvas is cleared before each drawing, ensuring that the progress arc is refreshed each time.

### Animation and Timer

- **Arc Animation:** A `NumberAnimation` is used on the `angle` property of the `Canvas` to animate the progress arc. The animation starts from 0 and ends a little more than 360 for a complete circle, with a duration of 20 seconds. The animation runs immediately when the processing screen is viewed.
- **Timed Actions:** In the processing screen, a timer is set to trigger after 20 seconds (same duration as the progress arc animation), at which point it pops the top item off the stack, thus transitioning away from the processing screen.

### Signals and Navigation

- **Signals:** Extensively used for component communication, especially for triggering actions like selecting a coffee or adjusting preferences.

- **StackView for Screen Management:** The `StackView` is employed to manage navigation between various screens like the main menu, coffee details, and customization screens. This approach allows for smooth transitions and a clear navigation flow.

## Prerequisites

Before running the Coffee App, ensure you have the following installed:

- [Qt](https://www.qt.io/download) (version 5.15 or later)
- [Qt Quick Controls](https://doc.qt.io/qt-5/qtquickcontrols-index.html)

## Installation

1. Clone the repository to your local machine:
2. Navigate to the cloned directory:

## Running the Application

1. Open the project in Qt Creator.
2. Configure the project with the appropriate kit (e.g., Desktop Qt 5.15 MinGW 64-bit).
3. Build and run the application by clicking the "Run" button in Qt Creator.

## Usage

- **Select a Coffee:** From the main menu, click on your desired coffee type.
- **Customize Your Coffee:** Use sliders and radio buttons to customize your drink.
- **Favorite Selection:** Access and customize your favorite drinks.
- **Navigate:** Use 'Back' and 'Confirm' buttons to navigate through the app.

## Contributing

Contributions to Coffee App are welcome! Please read our [Contributing Guidelines](CONTRIBUTING.md) for more information.

## License

This project is licensed under the [MIT License](LICENSE).
