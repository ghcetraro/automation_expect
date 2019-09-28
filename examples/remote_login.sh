#!/usr/bin/expect -f 
 
 # Uso sshlogin.exp <ssh user> <ssh host> <ssh password> 
 #Seteamos timeout personalizado y procesamos los argumentos. 
 set timeout 20 
 set ip [lindex $argv 0] 
 set user [lindex $argv 1] 
 set password [lindex $argv 2] 
 #regex con los caracteres mas comunes en las consolas (habitualmente '$') 
 set prompt "(%|#|I|\\$)" ; 
 
 proc logger {message} { 
#Método que imprime por pantalla a modo de log. 
set HEADER \[DEPLOY_LOG\]; 
#puts imprime por consola lo que indiquemos. 
puts "\n $HEADER $message $HEADER \n"; 
 }
proc exit_on_error {message} { 
#Ha habido un error. Traceamos y salimos. 
logger $message 
exit 1  } 
 #Login ssh 
 logger "Conectando a $ip como $user" 
 #Lanzamos la sesión ssh sin comprobar la existencia del host en la máquina 
 #Ver alternativa a "StrictHostKeyChecking no" 
 spawn ssh -o "StrictHostKeyChecking no" "$user\@$ip"; 
  
 expect { 
 #Control de las posibles entradas. Timeout, eof genérico o peticion de pass 
       "*assword" {send "$password\r";  
             logger "Login en $ip como $user correcto." 
#Con exp_continue, indicamos que vuelva a procesar la entrada con los inputs #de este bloque expect. Si la pass es incorrecta no se quedará colgado ya que #hay un numero de intentos máximos y saldrá por eof 
                   exp_continue 
            } 
  -re $prompt { 
#Si la conexión ha ido bien, recibiremos una línea con un #carácter (%|#|I|\\$)  
         logger "Login en $ip como $user correcto." 
  }  
        timeout {exit_on_error "Fallo en la conexión SSH en expect" } 
        eof {exit_on_error "Fallo en la conexión SSH en expect. Salimos."} 
 } 
 
 #Sin timeout 
 set timeout –1 
 #Finalmente, el script deja el control al usuario 
 interact
