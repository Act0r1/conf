# #!/bin/bash
#
# if [ "$(pactl get-default-sink)" = "alsa_output.pci-0000_03_00.6.analog-stereo" ]; then
#     pactl set-default-sink "bluez_output.1C_6E_4C_8E_6F_77.1"
#     pactl set-default-source "bluez_output.1C_6E_4C_8E_6F_77.1"
# else
#     pactl set-default-sink "alsa_output.pci-0000_03_00.6.analog-stereo"
#     pactl set-default-source "alsa_output.pci-0000_03_00.6.analog-stereo"
# fi







#!/bin/bash

running_sinks=$(pactl list sinks | awk '/State:.*RUNNING/{getline; print $2}')
if [[ -n $running_sinks ]]; then
    # Toggle between Alsa output and Bluetooth output
    case $running_sinks in
        "alsa_output.pci-0000_03_00.6.analog-stereo")
            pactl set-default-sink "bluez_output.1C_6E_4C_8E_6F_77.1"
            echo "Switched to Bluetooth output"
            ;;
        *"bluez_output.1C_6E_4C_8E_6F_77.1")
            pactl set-default-sink "alsa_output.pci-0000_03_00.6.analog-stereo"
            echo "Switched to Alsa output"
            ;;
        *)
            echo "Unknown running sinks configuration"
            ;;
    esac
else
    echo "No running sinks found"
fi
