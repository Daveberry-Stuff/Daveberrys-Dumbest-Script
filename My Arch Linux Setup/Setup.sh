# just to note, I'M STILL A NEWBIE TO SHELL SCRIPTS!!!
# LET ME KNOW IF THERES ANY ERROR AND DO A ISSUE!!!
# I HAVENT TESTED IT OUT, THOUGH I THINK IT DOES WORK!!!

# why tf am i screaming

FISH=false
NVIDIA=false
CUSTOM_FASTFETCH=false

DISCORD=false
VESKTOP=false
LEGCORD=false

PS3='Choose your Discord: '
discord=("Discord" "Vesktop" "Legcord" "None")

AUR=false
FLATPAK=false

clear

function FISH() {
    while true; do
        read -p "> Do you want to install fish? (y/n/c) " yn
        case $yn in
        [Yy]*) return 0 ;;
        [Nn]*) return 1 ;;
        *) echo "Please answer y = YES or n = NO" ;;
        esac
    done
}

function NVIDIA() {
    while true; do
        read -p "> Do you want to install nvidia-utils? (y/n/c) " yn
        case $yn in
        [Yy]*) return 0 ;;
        [Nn]*) return 1 ;;
        *) echo "Please answer y = YES or n = NO" ;;
        esac
    done
}

function CUSTOM_FASTFETCH() {
    while true; do
        read -p "> Do you want to install custom fastfetch? (y/n/c) " yn
        case $yn in
        [Yy]*) return 0 ;;
        [Nn]*) return 1 ;;
        *) echo "Please answer y = YES or n = NO" ;;
        esac
    done
}

function AUR() {
    while true; do
        read -p "> Do you want to install Arch User Repository? (y/n/c) " yn
        case $yn in
        [Yy]*) return 0 ;;
        [Nn]*) return 1 ;;
        *) echo "Please answer y = YES or n = NO" ;;
        esac
    done
}

function FLATPAK() {
    while true; do
        read -p "> Do you want to install Flatpak? (y/n/c) " yn
        case $yn in
        [Yy]*) return 0 ;;
        [Nn]*) return 1 ;;
        *) echo "Please answer y = YES or n = NO" ;;
        esac
    done
}

if FISH; then {
    echo "Selected to Install fish."
    FISH=true
}; else
    {
        echo "Selected to not Install fish."
    }
fi

if NVIDIA; then {
    echo "Selected to Install nvidia-utils."
    NVIDIA=true
}; else
    {
        echo "Selected to not Install nvidia-utils."
    }
fi

if CUSTOM_FASTFETCH; then {
    echo "Selected to custom Install fastfetch."
    CUSTOM_FASTFETCH=true
}; else
    {
        echo "Selected to not custom Install fastfetch."
    }
fi

if AUR; then {
    echo "Selected to Install Arch User Repository."
    AUR=true
}; else
    {
        echo "Selected to not Install Arch User Repository."
    }
fi

if FLATPAK; then {
    echo "Selected to pick Install flatpak."
    FLATPAK=true
}; else
    {
        echo "Selected to not Install flatpak."
    }
fi

# select install in "${discord[@]}"; do
#     case $install in
#     "Discord")
#         echo "Selected to install Normal Discord."
#         DISCORD=true
#         VESKTOP=false
#         LEGCORD=false
#         break
#         ;;
#     "Vesktop")
#         echo "Selected to install Vesktop."
#         DISCORD=false
#         VESKTOP=true
#         LEGCORD=false
#         break
#         ;;
#     "Legcord")
#         echo "Selected to install Legcord."
#         DISCORD=false
#         VESKTOP=false
#         LEGCORD=true
#         break
#         ;;
#     "None")
#         echo "Selected to not install discord."
#         DISCORD=false
#         VESKTOP=false
#         LEGCORD=false
#         break
#         ;;
#     *) echo "Invalid option $REPLY!" ;;
#     esac
# done

echo "You have 5 seconds to back out! (CTRL + C)"
sleep 5

echo "We need your password as this script cannot install programs without a password!"
echo "Note: This script does NOT share your password, you are free to check the source code."
echo "I am not a evil person and I will ever brick a operating system, I am just making this script for newbies or for quick setups."
if $FISH; then {
    echo "Installing fish..."
    mkdir ~/.config/fish
    yes | sudo pacman -S fish
}; else {
    echo "Skipping fish..."
}; fi

if $NVIDIA; then {
    echo "Installing nvidia-utils and nvidia..."
    yes | sudo pacman -S nvidia-utils nvidia
}; else {
    echo "Skipping nvidia-utils..."
}; fi

if $CUSTOM_FASTFETCH; then {
    echo "Installing custom fastfetch..."
    yes | sudo pacman -S fastfetch

    mkdir ~/.config/fastfetch
    cp config.jsonc ~/.config/fastfetch/
    # me when open konsole, it fucking does fastfetch >:3

    if $FISH; then {
        echo fastfetch >~/.config/fish/config.fish
    }; else
        {
            # if i had to guess you were using fucking bash lmao
            mkdir ~/.dave_arch_setup_backup
            mv ~/.bashrc ~/.dave_arch_setup_backup
            echo fastfetch >~/.bashrc
        }
    fi
}; else {
    echo "Skipping custom fastfetch..."
}; fi

if $AUR; then {
    echo "Installing Arch User Repository..."
    # yes | sudo pacman -S go
    # actually does this need it :sob:

    git clone https://aur.archlinux.org/yay.git
    cd yay
    less PKGBUILD
    makepkg -si

    cd ..
    rm -rf yay
}; else {
    echo "Skipping Arch User Repository..."
}; fi

if $INSTALL_STEAM; then {
    echo "Installing Flatpak..."
    yes | sudo pacman -S flatpak
}; else {
    echo "Skipping Flatpak..."
}; fi