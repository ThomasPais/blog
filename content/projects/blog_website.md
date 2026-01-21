+++
title = "Personal blog website"
description = "This is my personal blog website built with Zola. It was designed to be minimalist and fast."
date = 2025-11-27

[taxonomies]
tags = ["web"]

[extra]
status = "Active"
math = true

+++

I was using [Hugo](https://gohugo.io/) before switching to Zola for its simplicity and flexibility.

Here is the source code: [GitHub](https://github.com/yourusername/blog_website).

## Features

- **Search**: A search page is available using `elasticlunr.js` to index and search blog posts.
- **Responsive Design**: The website is designed to be responsive and works well on all devices.

## Design

### Typography

Text can be **bold**, _italic_, ~~strikethrough~~, and **~~_all at the same time_~~**.

[Link to another page](/).

# Heading 1

## Heading 2

### Heading 3

#### Heading 4

##### Heading 5

###### Heading 6

### Lists

- Item 1
- Item 2
  - Sub-item 2.1
  - Sub-item 2.2
- Item 3

1. Item 1
2. Item 2
3. Item 3

- [x] Completed Task
- [ ] Incomplete Task

### Tables

| Left Column 1 | Right Column 2 | Center Column 3 |
| :------------ | -------------: | :-------------: |
| Row 1         |          Row 1 |      Row 1      |
| Row 2         |          Row 2 |      Row 2      |

### Code Blocks

```vhdl
library EEE;
use IEEE.std_logic_1164.all;

-- this is the entity
entity ANDGATE is
  port ( 
    I1 : in std_logic;
    I2 : in std_logic;
    O  : out std_logic);
end entity ANDGATE;

-- this is the architecture
architecture RTL of ANDGATE is
begin
  O <= I1 and I2;
end architecture RTL;
```

```vhdl,linenos,hl_lines=5-10 15
library IEEE;
use IEEE.std_logic_1164.all;

-- this is the entity
entity ORGATE is
  port ( 
    I1 : in std_logic;
    I2 : in std_logic;
    O  : out std_logic);
end entity ORGATE;

-- this is the architecture
architecture RTL of ORGATE is
begin
  O <= I1 or I2;
end architecture RTL;
```

### Math

$$E=mc^2$$

The energy of a particle is given by the equation $E=mc^2$, where $E$ is the energy, $m$ is the mass, and $c$ is the speed of light.

### Images

![Image Alt Text](/path/to/image.jpg)

### Videos

<!--<video controls>
  <source src="/path/to/video.mp4" type="video/mp4">
</video>-->

<iframe src="https://www.youtube.com/embed/dQw4w9WgXcQ?si=elg9RvgVUg2Y1PxS" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Quotes

> This is a quote.

### Alerts

> [!note]
> This is a note.

> [!warning]
> This is a warning.
