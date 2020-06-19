# Eger WT'de güzel görünüm isfalseetiyor isen 
https://github.com/JanDeDobbeleer/oh-my-posh#installation kur 
# Yoksa glyphler problemn oluyor
# Ancak bu sadece Eterminalde çalışıyor çünkü tüm fontları Powershell nedense görmüyor

wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/font-patcher

sudo apt install python  fontforge

# glyph'leri kopyala

sudo apt install subversion

# font-patcher home dirda nerd glyphlerini arıyor

svn checkout https://github.com/ryanoasis/nerd-fonts/trunk/src


fontforge --script ./font-patcher CascadiaCode_2005.15/ttf/CascadiaCode.ttf -c

# 'Caskaydia Cove Regular Nerd Font Complete.ttf' üretiliyor -c ile 
# Bu metod ile herhangi bir fontu dönüştürebilirsin
