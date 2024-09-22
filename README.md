# Spacemacs Layer for Zettel-Composer

This is a Spacemacs layer that integrates the `zettel-compose` package, which provides a wrapper for the `zettel-compose.py` script. This layer makes it easy to run and stop `zettel-compose` commands directly from Spacemacs using custom keybindings.

## Installation

### 1. Clone the Repository

Navigate to your Spacemacs `private` layers directory and clone this repository:

```bash
cd ~/.emacs.d/private/
git clone https://github.com/brunocbr/zettel-compose-layer.git zettel-compose
```

### 2. Add the Layer to Your `.spacemacs` File

Open your `.spacemacs` configuration file and add `zettel-compose` to the `dotspacemacs-configuration-layers` list:

```elisp
(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-configuration-layers
   '(
     ;; other layers...
     zettel-compose
     )))
```

### 3. Install Dependencies

Ensure that the [`zettel-compose.py` script](https://github.com/brunocbr/zettel-composer/blob/master/zettel-compose.py) is installed and accessible on your system. You can set the path to the script in the layer configuration if it's located somewhere other than the default `/usr/local/bin`.

### 4. Restart Spacemacs

Restart Spacemacs to load the new layer and apply the configurations.

## Usage

This layer provides two main commands that are bound to Spacemacs keybindings, all prefixed with `SPC m a Z`.

### Available Keybindings

The following keybindings are provided, all under the prefix `SPC a Z`:

| Keybinding  | Description                                                                                   |
|-------------|-----------------------------------------------------------------------------------------------|
| `SPC a Z Z` | Run `zettel-compose-run` for the current buffer with interactive options.                     |
| `SPC a Z o` | Run `zettel-compose-generate-output`, which executes the script with specific output options. |
| `SPC a Z S` | Stop all running asynchronous `zettel-compose` processes.                                     |
| `SPC a Z h` | Generate a handout using `zettel-compose-generate-handout`.                                   |
| `SPC a Z H` | Stream a handout to Marked using `zettel-compose-stream-handout`.                             |
| `SPC a Z b` | Browse the connected notes using `zettel-compose-browse`.                                     |
|             |                                                                                               |


### Running the Zettel Composer

To run `zettel-compose`, simply type:

```
SPC m a Z Z
```

You will be prompted for an output file and asked if you want to stream to the marked file or watch the input file.

### Stopping Zettel-Compose Processes

If you have any running `zettel-compose` processes, you can stop them by typing:

```
SPC m a Z S
```

This will terminate all active `zettel-compose` processes.

## Customization

You can customize the behavior of the `zettel-compose` script by editing the options passed in the `zettel-compose-run` command in `zettel-compose.el`. For example, you can add more options or change the default paths.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

