# In questo Script Powershell si definiscono le variabili per permettere la corretta PROGRAMMAZIONE della Scheda Arduino (con il codice relativo alla Classificazione MNIST).

#####################################
# PARTE DA CONFIGURARE
#####################################

# Sostituire i puntini con il nome della seriale a cui la scheda Arduino è connessa (es. COM6):
$COM_Port = "COM28"

# Sostituire i puntini con l'indirizzo dove si trova il programma bossac.exe (tipicamente si trova qui: "C:\Users\<User Name>\Documents\ArduinoData\packages\arduino\tools\bossac\1.9.1-arduino2/bossac.exe"):
$Indirizzo_programmer = ""C:\Users\<User Name>\Documents\ArduinoData\packages\arduino\tools\bossac\1.9.1-arduino2/bossac.exe"

# Sostituire i puntini con l'indirizzo dove avete salvato il file binario (.bin) del programma di Classificazione MNIST (es. "C:\Users\<User Name>\Desktop\Arduino_MNIST\nano_ble33_sense_camera.ino.bin"):
$Indirizzo_script_bin = "C:\Users\<User Name>\Desktop\Arduino_MNIST\nano_ble33_sense_camera.ino.bin"


#####################################
# NON MODIFICARE IL CODICE CHE SEGUE!
#####################################

Write-Output "Reset della scheda Arduino in corso sulla porta $COM_Port..."

# Crea un oggetto SerialPort usando i parametri corretti:
$port = New-Object System.IO.Ports.SerialPort($COM_Port, 1200, [System.IO.Ports.Parity]::None, 8, [System.IO.Ports.StopBits]::One)
$port.Open()
$port.Close()

Write-Output "Reset effettuato con successo."

Write-Output "Avvio del programmatore bossac.exe..."
# Esegue bossac.exe con i parametri specificati:
& $Indirizzo_programmer -d --port=$COM_Port -U -i -e -w $Indirizzo_script_bin -R

Write-Output "Programmazione completata."
Write-Output "Premi INVIO per terminare..."
Read-Host


