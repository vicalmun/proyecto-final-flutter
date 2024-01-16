# proyecto_final

A new Flutter project.

## Información de interés
El backend no tiene DB, la autenticación es 'ficticia' ya que se le pasa un user y una pw y devuele un token que el back comprueba para dar acceso a las rutas protegidas.

Usuario: `victor`
Contraseña: `alba`

Como uso un Drawer para hacer la navegación entre pantallas, salta una excepción. Si se desmarca la casilla 'Uncaught exceptions' en el menú de Debug, no salta.

## Ejecución
He encontrado un problema en el ciclo de ejecución con los flujos de datos que no soy capaz de resolver:
Cuando se hace una primera petición (sin token) sale el modal del error, pero al cancelar entra directamente al estado de loading y de ahí no se mueve. No he sido capaz de hacer que después del error se quede esperando un nuevo flujo de datos y que no vaya directamente al loading.

## ¿cómo funciona?
La app tiene 3 pantallas:
- Login: donde se hace la autenticación y se obtiene el token
- New idea: hace la petición a la api para crear una nueva idea
- Ideas: muestra las ideas creadas. Es una lista con Tiles que se expanden. Con un toque (onTap) se expande y muestra la descripción y con un doble toque (onDoubleTap) se navega a la vista detalle. Con un swipe a la izquierda se borra la idea.

