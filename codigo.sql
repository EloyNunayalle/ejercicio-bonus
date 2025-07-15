CREATE TABLE Samples(
    sample_id INT,
    dna_sequence VARCHAR(200),
    species VARCHAR(100)

);

-- primaria:
ALTER TABLE Samples
    ADD PRIMARY KEY (sample_id);

-- ejemplos:
INSERT INTO Samples (sample_id, dna_sequence, species)
VALUES
    (1, 'ATGCTAGCTAGCTAA', 'Human'),
    (2, 'GGGTCAATCATC', 'Human'),
    (3, 'ATATATCGTAGCTA', 'Human'),
    (4, 'ATGGGGTCATCATAA', 'Mouse'),
    (5, 'TCAGTCAGTCAG', 'Mouse'),
    (6, 'ATATCGCGCTAG', 'Zebrafish'),
    (7, 'CGTATGCGTCGTA', 'Zebrafish');

--  consulta:
SELECT sample_id, dna_sequence, species,
       (dna_sequence LIKE 'ATG%')::int AS has_start,
       (dna_sequence LIKE '%TAA' OR dna_sequence LIKE '%TAG' OR dna_sequence LIKE '%TGA')::int AS has_stop,
       (dna_sequence LIKE '%ATAT%')::int AS has_atat,
       (dna_sequence LIKE '%GGG%')::int AS has_ggg
FROM Samples
ORDER BY sample_id;
