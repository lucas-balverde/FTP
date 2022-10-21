export IFS=","
cat /home/lucas/Bureau/Shell.exe/Job_9/Shell_Userlist.csv | while read Id Prenom Nom Mdp Role
 do
 echo "$Prenom-$Nom:$Mdp" | sudo chpasswd
 sudo usermod -u "$Id" "$Prenom-$Nom"
        if [ "$Role" = "Admin" ]
         then
         sudo usermod -aG sudo $Prenom-$Nom
        fi

 done
