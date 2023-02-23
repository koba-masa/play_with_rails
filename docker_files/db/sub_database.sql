DROP TABLE IF EXISTS prefectures CASCADE;
CREATE TABLE prefectures(
    id SERIAL PRIMARY KEY
  , name VARCHAR(32) NOT NULL
  , name_en VARCHAR(32) NOT NULL
);

INSERT INTO prefectures VALUES
    (1, '北海道', 'hokkaido')
  , (2, '青森県', 'aomori')
  , (3, '岩手県', 'iwate')
  , (4, '宮城県', 'miyagi')
  , (5, '秋田県', 'akita')
;

DROP TABLE IF EXISTS castles CASCADE;
CREATE TABLE castles(
    id SERIAL PRIMARY KEY
  , name VARCHAR(32) NOT NULL
  , prefecture INTEGER NOT NULL REFERENCES prefectures
);

INSERT INTO castles(name, prefecture) VALUES
    ('五稜郭', 1)
  , ('弘前城', 2)
;
