
(deffuzzy nivel_agua
   (low (0 1.0) (50 0.5) (100 0))
   (medium (0 0) (50 1.0) (100 0))
   (high (0 0) (50 0.5) (100 1.0))
)

(deffuzzy radiacion_solar
   (low (0 1.0) (500 0.5) (1000 0))
   (medium (0 0) (500 1.0) (1000 0))
   (high (0 0) (500 0.5) (1000 1.0))
)

(deffuzzy velocidad_viento
   (low (0 1.0) (10 0.5) (20 0))
   (medium (0 0) (10 1.0) (20 0))
   (high (0 0) (10 0.5) (20 1.0))
)

(deffuzzy produccion_energia
   (low (0 1.0) (50 0.5) (100 0))
   (medium (0 0) (50 1.0) (100 0))
   (high (0 0) (50 0.5) (100 1.0))
)

(deftemplate datos
   (slot nivel_agua)
   (slot radiacion_solar)
   (slot velocidad_viento)
)

(defrule calcular-produccion-alta
   (datos (nivel_agua ?na) (radiacion_solar ?rs))
   (fuzzy-or (fuzzy-and (nivel_agua high) (radiacion_solar high))
             (fuzzy-and (nivel_agua high) (velocidad_viento medium)))
   =>
   (assert (produccion_energia high))
)

(defrule calcular-produccion-media
   (datos (nivel_agua ?na) (radiacion_solar ?rs) (velocidad_viento ?vw))
   (fuzzy-and (radiacion_solar medium) (velocidad_viento medium))
   =>
   (assert (produccion_energia medium))
)

(defrule calcular-produccion-baja
   (datos (nivel_agua ?na) (velocidad_viento ?vw))
   (fuzzy-or (fuzzy-and (nivel_agua low) (velocidad_viento high))
             (radiacion_solar low))
   =>
   (assert (produccion_energia low))
)
