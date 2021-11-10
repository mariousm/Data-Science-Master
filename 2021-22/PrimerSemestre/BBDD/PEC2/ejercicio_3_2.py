red_social = [
    ('Alicia', 'Benito'),
    ('Benito', 'Alicia'),
    ('Carlos', 'Benito'),
    ('Benito', 'Carlos'),
    ('Daniela', 'Enrique'),
    ('Enrique', 'Francisco'),
    ('Francisco', 'Enrique'),
    ('Daniela', 'Benito')
]

# PRIMER PASO: MAP
def map(lista):
    # Recorremos cada elemento de la lista y lo mapeamos
    for relation in lista:
        return(((relation[0], relation[1]), 1))


resultado_mapeo = [
    (('Alicia', 'Benito'), 1),
    (('Benito', 'Alicia'), 1),
    (('Carlos', 'Benito'), 1),
    (('Benito', 'Carlos'), 1),
    (('Daniela', 'Enrique'), 1),
    (('Enrique', 'Francisco'), 1),
    (('Francisco', 'Enrique'), 1),
    (('Daniela', 'Benito'), 1)
]

# SEGGUNDO PASO: SHUFFLE
resultado_shuffle = [
    (('Alicia', 'Benito'), [1, 1]),
    (('Carlos', 'Benito'), [1, 1]),
    (('Daniela', 'Enrique'), [1]),
    (('Enrique', 'Francisco'), [1, 1]),
    (('Daniela', 'Benito'), [1])
]

# TERCER PASO: REDUCE
def reduce(k, listV):
    # Calculamos el número de la lista de valores, si es menor o igual a 1 devolvemos la clave
    num_listaV = len(listV)

    if num_listaV <= 1:
        return(k)

resultado_reduce = [
    ('Daniela', 'Enrique'),
    ('Daniela', 'Benito')
]