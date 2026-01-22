+++
title = "Personal blog website"
description = "This is my personal blog website built with Zola. It was designed to be minimalist and fast."
date = 2026-01-21
updated = 2026-01-22

[taxonomies]
tags = ["web"]

[extra]
status = "Active"
+++

I previously used [Hugo](https://gohugo.io/) but decided to migrate to [Zola](https://www.getzola.org/). While Hugo is powerful, I found Zola's single-binary approach and Tera templating engine to be more intuitive and flexible for my specific goals. 

A live demo is available at [thomaspais.com](https://thomaspais.com) and the complete source code is hosted on [GitHub](https://github.com/ThomasPais/blog). 

If you are interested in building a similar setup, check out my guide: [Build a static blog website with Zola from scratch](/posts/build-a-static-blog-website-with-zola-from-scratch).

## Tech Stack

This website is built using the following technologies:

* **Static Site Generator:** [Zola](https://www.getzola.org/) (Rust-based)
* **Deployment & CI/CD:** Netlify with custom DNS
* **Math Rendering:** [KaTeX](https://katex.org/) for high-speed client-side LaTeX processing

## Core Features

- **Dark/Light Mode** - A theme system that respects user preferences.
- **Client-SideSearch** - Fast, local indexing using `elasticlunr.js` for efficient search without relying on external services.
- **Responsive Design** - Mobile-first design ensuring compatibility from smartphones to 4K displays.
- **Performance-First** - Minimalist CSS and zero unnecessary JavaScript to ensure a sub-1s load time.
- **SEO** - Automated sitemap generation and meta tag optimization.

I achieved a perfect score across all [PageSpeed Insights](https://pagespeed.web.dev/analysis/https-thomaspais-com/upcplkwd74?form_factor=mobile) categories. This ensures a seamless experience even for users on low-bandwidth connections.

![Website Performance Metrics](web-results.webp)

## Design

I focused on simplicity and readability, ensuring that the content is easily readable. 

You can explore the design and features of the website by visiting this [design page](/design).

## Conclusion

Overall, Zola was really easy to set up and use compared to Hugo. It's a great choice for building simple static blog websites. 

One feature that I missed was the [render hooks](https://gohugo.io/render-hooks) feature of Hugo, which allows to override default rendering behavior. However, using shortcodes can achieve similar results.
