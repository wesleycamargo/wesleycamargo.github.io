# Wesley Camargo's Blog

A personal blog built with [Hugo](https://gohugo.io/) static site generator and the beautiful [Stack theme](https://github.com/CaiJimmy/hugo-theme-stack).

![Blog Screenshot](https://github.com/user-attachments/assets/36c9f80a-c0ca-47ae-8c9a-abc4c328af02)

## 🚀 Features

- **Responsive Design** - Works perfectly on desktop and mobile devices
- **Dark Mode Support** - Toggle between light and dark themes
- **Search Functionality** - Find content quickly with built-in search
- **Tag Cloud** - Explore content by tags and categories
- **Archive Page** - Browse posts chronologically
- **Table of Contents** - Navigate long posts easily
- **Fast Performance** - Static site generation for optimal speed

## 📋 Prerequisites

- [Hugo Extended](https://gohugo.io/installation/) version 0.123.0 or later
- [Git](https://git-scm.com/) for version control

## 🛠️ Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/wesleycamargo/wesleycamargo.github.io.git
   cd wesleycamargo.github.io
   ```

2. **Initialize and update the theme submodule:**
   ```bash
   git submodule update --init --recursive
   ```

3. **Install Hugo Extended** (if not already installed):
   
   **On macOS:**
   ```bash
   brew install hugo
   ```
   
   **On Ubuntu/Debian:**
   ```bash
   sudo apt-get install hugo
   ```
   
   **On Windows:**
   Download from [Hugo Releases](https://github.com/gohugoio/hugo/releases)

4. **Verify Hugo installation:**
   ```bash
   hugo version
   ```

## 🏗️ Local Development

1. **Start the development server:**
   ```bash
   hugo server --buildDrafts
   ```

2. **Open your browser and visit:**
   ```
   http://localhost:1313
   ```

3. **The site will automatically reload when you make changes to:**
   - Content files (`.md` files)
   - Configuration (`hugo.toml`)
   - Layouts and templates

## 📝 Creating Content

### New Blog Post

```bash
hugo new content/post/my-new-post/index.md
```

### New Page

```bash
hugo new content/page/my-new-page/index.md
```

### Content Structure

```
content/
├── post/           # Blog posts
│   └── hello-world/
│       ├── index.md
│       └── cover.jpg
└── page/           # Static pages
    ├── about/
    ├── search/
    └── archives/
```

## 🔧 Configuration

The site configuration is located in `hugo.toml`. Key settings include:

- **baseURL**: Your site's URL
- **title**: Site title
- **theme**: Set to `hugo-theme-stack`
- **params**: Theme-specific configuration

## 📦 Building for Production

1. **Build the static site:**
   ```bash
   hugo --minify
   ```

2. **The generated site will be in the `public/` directory**

3. **Deploy the `public/` directory to your web server or hosting service**

## 🎨 Customization

### Avatar and Images

- Place your avatar in `static/img/avatar.png`
- Add cover images to your post directories
- Images are automatically optimized by Hugo

### Theme Configuration

The Stack theme offers extensive customization options. Check the theme's [documentation](https://stack.jimmycai.com/) for details.

### Social Links

Update the social menu in `hugo.toml`:

```toml
[[menu.social]]
    identifier = 'github'
    name = 'GitHub'
    url = 'https://github.com/yourusername'
    [menu.social.params]
        icon = 'brand-github'
```

## 📚 Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Stack Theme Documentation](https://stack.jimmycai.com/)
- [Stack Theme Demo](https://demo.stack.jimmycai.com/)
- [Markdown Guide](https://www.markdownguide.org/)

## 🤝 Contributing

Feel free to open issues or submit pull requests if you find any bugs or have suggestions for improvements.

## 📄 License

This blog is licensed under the MIT License. The Stack theme is licensed under the GPL-3.0 License.