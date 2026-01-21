
+++
title = "Setting up TerosHDL to create HDL projects"
description = "When working on HDL projects, it is important to have a good development environment. TerosHDL is an open-source tool that can help you create, simulate, and synthesize your designs."
date = 2026-11-01
updated = 2026-12-01
draft = true
[taxonomies]
tags = ["vhdl", "hardware"]
+++

## Overview

TerosHDL is for me the best tool to create HDL projects, it handles formatting and linting to prevent errors and formatting issues. You can find more information about TerosHDL on their [official website](https://terostechnology.github.io/terosHDLdoc/).

## Installation

TerosHDL can only be used with VSCodium or VSCode. I only tested it with [VSCodium](https://vscodium.com). Before installing the TerosHDL extension, we will need other tools listed on this [page](https://terostechnology.github.io/terosHDLdoc/docs/installation_checklist/installation).

I recommend setting up a virtual environment to isolate your project dependencies. You can create a virtual environment using the following command:

```bash
python3 -m venv .venv
```

Activate the virtual environment using the following command on linux:
```bash
source .venv/bin/activate
```

On windows, you can use the following command:
```cmd
.venv\Scripts\activate
```

Now that you have activated the virtual environment, you can install the required python packages using `pip`:

```bash
pip install vunit-hdl edalize yowasp-yosys cocotb
```


Once you have installed the required tools, you can install the TerosHDL extension from the marketplace and go to the extention panel to verify that your environment is setup.

## Usage

Once installed, you can start using TerosHDL by opening the application. The application provides a graphical user interface that allows you to create, simulate, and synthesize your designs.

TODO
