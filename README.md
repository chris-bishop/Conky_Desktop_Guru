# Conky Desktop Guru
## How to Install
   1. Run the following command to install conky:
      > sudo apt install conky-all
   2. Create the config file:
      > conky -C > ~/Documents/conky.config
   3. Create the conky folder in the home directory:
      > mkdir ~/.config/conky
   4. Replace the content of the created config file with the content from [this file](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/conky.config) "You can use any text editor to copy the content"
   5. Copy the file to the conky folder in your home directory:
      > cp -v ~/Documents/conky.config ~/.config/conky
   6. Adjust the hardware configuration according to your settings
      - Your network adapter parameter "Replace enp6s0 with the name of your network adapter" Run the below command to find the name of your network adapter:
         > sudo ifconfig
      - Your processor "Replace AMD Ryzen 5 @ 3.60GHz with the name of your processor" 
      - The number of your CPU cores, run the following command to find out how many cores is your CPU:
         > nproc
   7. 



