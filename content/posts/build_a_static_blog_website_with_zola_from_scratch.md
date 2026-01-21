+++
title = "Build a static blog website with Zola from scratch"
description = "Learn how to build a static blog website with Zola like this one from scratch."
date = 2025-11-01
updated = 2026-12-01
[taxonomies]
tags = ["web"]
+++

## What is Zola?

Zola is a static site generator written in Rust. It is designed to be fast, flexible, and easy to use.

## Getting started

### Installing Zola

Zola is available on all platforms, including Linux, macOS, and Windows. You can install it using the following commands:

- **Linux**: `sudo apt install zola`
- **macOS**: `brew install zola`
- **Windows**: Download the installer from the [official website](https://www.getzola.org/download/)

### Creating a project

To create a new project, run the following command:

```sh
zola init my-blog
```

This will create a new directory named `my-blog` with a basic Zola project structure:

- **content** - Contains your blog posts and pages.
- **sass** - Contains your .scss/.sass files.
- **static** - Contains your static assets like images, fonts, and other files.
- **templates** - Contains your HTML templates used to generate the website.

## Building the blog

The first step is to build the blog using the following command:

```sh
zola serve
```

This will generate the static files in the `public` directory and enable live reloading.

> [!note]
> To build the blog for production, run `zola build`.

Normally, the default page provided by Zola should appear at [http://localhost:1111](http://localhost:1111).

### Home page

The home page is the main page of your blog. To edit it, we need to create 2 template files:

- `templates/base.html` - The base template file that we will use as a foundation for all other pages.
- `templates/index.html` - The home page template file.

### Creating your first post

To create a new post, we need two more template files:

- `templates/posts.html` - The post list template file.
- `templates/post_page.html` - The post template file.


Then we can create a posts list page and 2 posts in the content directory:

- `content/posts/_index.md` - The posts list page.
- `content/posts/first.md` - The first post.
- `content/posts/second.md` - The second post.

```md,linenos,hl_lines=2
+++
title = "My first post"
date = 2019-11-27
+++

This is my first blog post.
```

The `+++` section in the post is called a frontmatter and it will contains information about the page.

### Adding some styling

Right now, the blog is using the default styles provided by your browser. To add some styling, we can create a new SCSS file in the `sass` directory:

Then we can add some basic styling to the blog:

```scss
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}
```

All scss files will be compiled into a single CSS file that will be included in the HTML page.

To include the CSS file in the HTML page, we need to add a link tag in the `templates/base.html` file:

```html
<link rel="stylesheet" href="/css/main.css">
```

### Adding color theme toggle

```js
document.addEventListener('DOMContentLoaded', () => {
    const themeToggle = document.getElementById('theme-toggle');
    const body = document.body;

    themeToggle.addEventListener('click', () => {
        body.classList.toggle('dark');
    });
});
```

### Adding search

Zola makes it easy to add a search feature to your blog. It can build a search index from your content and provide a javascript search library. We only need to add a search page and some javascript to use the search feature.

```js
Search JS TODO
```

### Adding tags

To enable tags, we need to add a `taxonomies` section in the `config.toml` file:

```toml
[taxonomies]
tag = "tags"
```

We can add tags to our posts by adding a `tags` field in the frontmatter of each post. For example:

```md
+++
title = "My first post"
date = 2019-11-27
[taxonomies]
tags = ["zola", "blog"]
+++

This is my first blog post.
```

## Conclusion

I hope this post helped you get started with Zola.
