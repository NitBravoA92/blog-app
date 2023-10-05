<a name="readme-top"></a>

<div align="center">
  <h1><b>Blog App | Ruby on Rails Project</b></h1>
</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [Blog App ](#blog-app-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

---

<!-- PROJECT DESCRIPTION -->

# Blog App <a name="about-project"></a>

**"Blog App"** is a website built with Ruby on Rails and PostgreSQL that allows users to create and publish posts, write comments, and like posts.

---

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Backend</summary>
  <ul>
    <li><a href="https://guides.rubyonrails.org/">Ruby on Rails (v7.0.8)</a></li>
    <li><a href="https://www.postgresql.org/docs/">PostgreSQL</a></li>
  </ul>
</details>

<details>
  <summary>Frontend</summary>
  <ul>
    <li><a href="https://www.w3schools.com/html/">HTML5</a></li>
    <li><a href="https://www.w3schools.com/css/">CSS</a></li>
    <li><a href="https://www.rubyguides.com/2018/11/ruby-erb-haml-slim/">ERB template</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

<ul>
  <li>Ruby on Rails framework</li>
  <li>
    Use Linters to check code quality
    <ul>
      <li>Rubocop</li>
      <li>Stylelint</li>
    </ul>
  </li>
  <li>MVC architectural/design pattern</li>
  <li>Data persistent in PostgreSQL</li>
  <li>Test the application with rspec and capybara gems</li>
  <li>Authentication system build with devise gem</li>
  <li>Authorization rules using CanCanCan gem</li>
  <li>Follow Microverse's list of best practices</li>
</ul>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

<ul>
    <li><p>A code editor (we recommend Visual Studio Code)</p></li>
</ul>

<ul>
    <li><p>Git and a GitHub account</p></li>
</ul>

<ul>
    <li><p>MailCatcher (This is optional)</p></li>
</ul>

### Setup

Clone this repository to your desired folder by using this 👇️ command :

```
git clone https://github.com/NitBravoA92/blog-app.git
```

### Install

Go to the project directory:

```
 cd blog-app
```

Before to run the program, verify that you have Ruby on Rails installed on your OS running the following command:

```
 rails --version
```

It should show you the version of ruby on rails ​​installed. If this does not happen and only an error message is displayed, then you should either verify your installation or install Ruby on Rails from scratch.

[Download and Install Ruby on Rails](https://guides.rubyonrails.org/getting_started.html)

Once you have verified that you have Ruby on Rails installed, run the following command to install the necessary gems:

```
 bundle install
```

After installing the gems, run the following command to create the database:

```
 rails db:create
```

Then run the following command to migrate the database:

```
 rails db:migrate
```

**Note:** This is completely optional but if you want to test the functionality of sending confirmation email and password reset locally, it is recommended that you install the `MailCatcher` gem. This tool runs a super simple SMTP server which catches any message sent to it to display in a web interface.

To install it, it is as simple as running the following command in your terminal:

```
 gem install mailcatcher
```

Once installed, run the following command to start the server:

```
 mailcatcher
```

This will start the local SMTP server on port 1025. You can now open your browser and go to http://localhost:1080/ to see the messages sent to the SMTP server.

So when you register a new user in the application, a confirmation email will automatically be sent to the user which you can check in your mailcatcher inbox. Emails for password reset can also be verified in mailcacher.


If you want to know more about this gem, visit its official documentation: [Mailcacher](https://mailcatcher.me/)

### Usage

Run the following command inside the project folder to start the application:

```
 rails s
```

This will start the application on your local server. You can now open your browser and go to http://localhost:3000/ to see the application running.

### Run tests

To execute the tests, run the following command inside the project folder:

```
 rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Nitcelis Bravo**

- GitHub: [Nitcelis Bravo](https://github.com/NitBravoA92)
- Twitter: [@softwareDevOne](https://twitter.com/softwareDevOne)
- LinkedIn: [Nitcelis Bravo Alcala](https://www.linkedin.com/in/nitcelis-bravo-alcala-b65340158)

👤 **Cesar Herrera**
-   GitHub: [@CesarHerr](https://github.com/CesarHerr)
-   LinkedIn: [Cesarherr](https://www.linkedin.com/in/cesarHerr/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

Upcoming improvements:

- [x] Creating a data model
- [x] Processing data in models
- [x] Validations and model specs
- [x] Controllers
- [x] Views
- [x] Add Forms to create a new post and comments
- [x] Add the functionality to save likes
- [x] Add the integration tests using capybara gem
- [x] Authentication using devise gem
- [x] Authorization using CanCanCan gem

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/NitBravoA92/blog-app/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project and know someone who might find it helpful, please share it.
Or give it a **star** ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I thank Microverse for this fantastic opportunity, and the code reviewers for their advice and time.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---
