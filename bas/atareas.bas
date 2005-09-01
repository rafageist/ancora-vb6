Attribute VB_Name = "atareas"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2BE037F"
Option Explicit

'ToolTipText
'[generar modelos] mejorar los modelos p3,p4 y crear el modelo p2

'[POSPUESTO]
'- N turnos N dias jja!
'- varios profes y lugares necesarios para una actividad
'- Cuando se pide MPI, se le debe pasar el rango, pa que busque solo en ahi,
'y no por gusto en otros lugares, incluso en la zpriori actual y no que pregunte esto al final,

'------------------------------------------------------------------------------
'ELIMINACION y MODIFICACION
    'periodo *
        'rest de especialidad
        'rest de brigada
        'rest de asig
        'rest de lugar
        'rest de profesor
        'rest de recurso
        'rest de clasif
        'zpriori de clasif
        'lxact
        'pxact
        'rxact
        'asignaciones
        'imposibles
        'plantillas de periodos
        'desgloses
        'ancora.hrt.exceptoEnTiempo

    'especialidad
        'brigadas de la especialidad
        'asignaturas de la especialidad
        'ancora.hrt

    'brigada *
        'grupo x clasif
            'pxact.grupos
        'asignaciones
        'imposibles
        'brigadas hrt
        'ancora.hrt
        
    'lugar
        'lxact
        'distancias
        'asignaciones
        'ancora.hrt
        
    'profesor
        'pxact
        'asignaciones
        'ancora.hrt
        
    'asignatura
        'desgloses
        'pxact
        'lxact
        'asignaciones
        'ancora.hrt
        
    'recurso
        'rxact
        'asignaciones
        'ancora.hrt
        
    'clasif
        'gxclasif
        'desgloses.act
        'asignaciones
        'imposibles

