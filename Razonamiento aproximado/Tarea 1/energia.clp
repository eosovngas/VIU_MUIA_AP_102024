
(deftemplate datos
   (slot nivel_agua)
   (slot radiacion_solar)
   (slot velocidad_viento)
   (slot produccion_energia))

(defrule calcular-produccion-alta
   (datos (nivel_agua ?na) (radiacion_solar ?rs) (velocidad_viento ?vw))
   (test (and (> ?na 70) (> ?rs 600)))
   =>
   (assert (produccion_energia "alta")))

(defrule calcular-produccion-media
   (datos (nivel_agua ?na) (radiacion_solar ?rs) (velocidad_viento ?vw))
   (test (and (> ?rs 300) (< ?rs 700) (> ?vw 5)))
   =>
   (assert (produccion_energia "media")))

(defrule calcular-produccion-baja
   (datos (nivel_agua ?na) (radiacion_solar ?rs) (velocidad_viento ?vw))
   (test (or (< ?na 50) (< ?rs 300) (< ?vw 5)))
   =>
   (assert (produccion_energia "baja")))

