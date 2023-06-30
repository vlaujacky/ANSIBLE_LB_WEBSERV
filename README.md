Modifier le fichier inventory selon votre configuration

Pour lancer les roles pour Load Balancing avec File et Installer Webserver: 
Aller dans le loadbalancer_with_file
Remplacer dans files/nginx.conf par les valeurs adaptés à votre configuration

ansible-playbook -i inventory playbook_web_lb_file.yaml -u rt -k

