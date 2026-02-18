# Magnet Nametag Generator

A customizable OpenSCAD generator for magnetic nametags.  
Text, font, size, margins, rounded corners, magnet placement, and text style are fully parametric.

## Features

- Configurable tag size derived automatically from text and margins
- Bold toggle for the text
- Text can be extruded outward or inverted (cut into the tag) with adjustable depth
- Smooth rounded corners with a single radius parameter
- Automatic magnet hole placement with configurable max spacing — adapts to tag width
- Visual indicators for the thin floor under magnets in preview mode
- Uses Liberation Mono for consistent cross-platform rendering (bundled with OpenSCAD)

## Usage

> *Online*
>1. Go to the [Makerworld model page](https://makerworld.com/models/XXXXXXX)
>2. Click on "Customize"

> *Local*
>1. Download and open the `.scad` file in [OpenSCAD](https://openscad.org).  
>2. Tweak the parameters in the Tag and Advanced sections at the top.  
>3. Press F5 to preview, then F6 to render.  
>4. Export to STL for printing.

## Parameters

### Tag

| Name | Type | Default | What it does |
|---|:---:|---|---|
| `input` | string | `"Custom Text"` | The main text displayed on the tag. |
| `bold` | bool | `true` | Toggle bold text. |
| `text_size` | mm | `10` | Height of the text. |
| `text_invert` | bool | `false` | Cut text into the tag instead of extruding outward. |
| `text_depth` | mm | `0.4` | Depth of the text extrusion or cut. |
| `margin` | mm | `2` | Margin around the text on all sides. |
| `tag_radius` | mm | `3` | Radius for all four rounded corners. |
| `magnet_diameter` | mm | `6` | Diameter of the magnet holes. |
| `magnet_height` | mm | `2` | Height of the magnet holes. |

### Advanced

| Name | Type | Default | What it does |
|---|:---:|---|---|
| `magnet_under` | mm | `0.4` | Thickness of the floor under the magnets. |
| `magnet_above` | mm | `0.6` | Thickness of the ceiling above the magnets. |
| `font_factor` | float | `0.8` | Width factor for text width calculation. Calibrate to your font. |
| `magnet_max_spacing` | mm | `30` | Maximum distance between magnet holes before an additional hole is added. |
| `name_line_spacing` | float | `1.5` | Line spacing multiplier for multi-line names. |
| `tag_color` | color | `"white"` | Color of the tag body. |
| `text_color` | color | `"black"` | Color of the text. |

## Pastebin

You can view or edit the code directly at the following links:

- Pastebin: [https://pb.73.nu/magnet-tag](https://pb.73.nu/magnet-tag)
- Fork: [https://pb.73.nu/magnet-tag/fork](https://pb.73.nu/magnet-tag/fork)
- Preview (using https://ochafik.com): [https://pb.73.nu/magnet-tag/view](https://pb.73.nu/magnet-tag/view)

## License

This project is licensed under the  
**Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)**  
You may remix, adapt, and build upon this work **non-commercially**, as long as you **credit the original creator**.

More info: [https://creativecommons.org/licenses/by-nc/4.0/](https://creativecommons.org/licenses/by-nc/4.0/)

---

Created by **Christian Leroch**  
https://www.Leroch.net
