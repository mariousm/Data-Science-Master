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
        return(((relation[1]), (relation[0])))


resultado_mapeo = [
    (('Benito'), ('Alicia')),
    (('Alicia'), ('Benito')),
    (('Benito'), ('Carlos')),
    (('Carlos'), ('Benito')),
    (('Enrique'), ('Daniela')),
    (('Francisco'), ('Enrique')),
    (('Enrique'), ('Francisco')),
    (('Benito'), ('Daniela')),
    (('Benito'), ('Alicia'))
]

# SEGGUNDO PASO: SHUFFLE
resultado_shuffle = [
    (('Benito'), [('Alicia'), ('Carlos'), ('Daniela')]),
    (('Alicia'), [('Benito')]),
    (('Carlos'), [('Benito')]),
    (('Enrique'), [('Daniela'), ('Francisco')]),
    (('Francisco'), [('Enrique')]),
    (('Daniela'), [])
]

# TERCER PASO: REDUCE
def reduce(k, listV):
    # Calculamos el número de seguidores que tiene cada persona
    return((k, len(listV)))

resultado_reduce = [
    (('Benito'), 3),
    (('Alicia'), 1),
    (('Carlos'), 1),
    (('Enrique'), 2),
    (('Francisco'), 1),
    (('Daniela'), 0)
]