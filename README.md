# OpenWall

**OpenWall** is a Flutter-based wallpaper app that allows users to set modern and high-quality wallpapers on their phones. This app utilizes the [Pexels API](https://www.pexels.com/api/) to provide a wide range of stunning wallpapers. The app is designed with a clean and intuitive interface, making it easy for users to browse, search, and download wallpapers.

![OpenWall Banner](assets/banner_image/banner.jpg)

## Features

- **Browse Wallpapers:** Explore a wide variety of wallpapers from different categories.
- **Search Functionality:** Quickly find the perfect wallpaper by searching with keywords.
- **Set Wallpapers:** Easily set wallpapers directly from the app.
- **Toast Notifications:** Receive toast notifications for actions such as setting wallpapers.
- **Modern UI Design:** A sleek and modern user interface with a blue and white theme.

## Installation

To get started with OpenWall, follow these steps:

1. **Clone the repository:**

    ```bash
    git clone https://github.com/DevNadimm/OpenWall.git
    cd OpenWall
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the app:**

    ```bash
    flutter run
    ```

## API Integration

This app uses the [Pexels API](https://www.pexels.com/api/) to fetch and display wallpapers. To use the API, you'll need to obtain an API key from Pexels and add it to your project.

1. **Get your API key:**
    - Sign up at [Pexels](https://www.pexels.com/api/) and obtain your API key.

2. **Add your API key:**
    - Replace the placeholder API key in the project with your own.

    ```dart
    const String pexelsApiKey = 'YOUR_API_KEY_HERE';
    ```

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, feel free to open an issue or submit a pull request.


## Contact

If you have any questions or want to get in touch, you can reach me at nadimchowdhury87@gmail.com.

## Acknowledgements

- [Pexels API](https://www.pexels.com/api/) for providing the wallpaper data.
- Flutter community for continuous support and inspiration.
