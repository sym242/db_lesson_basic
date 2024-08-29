Q1
CREATE TABLE departments (
department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Q2
ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;

Q3
INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name,email,department_id,age,gender)
VALUES
('松本たかし','matsumoto@gizumo.jp',1,52,1),
('浜田みつとし','hamada@gizumo.jp',1,54,1),
('山崎啓生','yamazaki@gizumo.co.jp',1,50,1),
('田中正','tanatada@gizumo.jp',2,51,1),
('遠藤浩三','endo@gizumo.jp',2,52,1),
('片桐あつや','katagiri@gizumo.jp',2,61,1),
('滝沢ももか','takizawa@gizumo.jp',2,28,2),
('穴井ゆうき','anai@gizumo.jp',3,22,1),
('高瀬ゆうこ','takase@gizumo.jp',4,32,2),
('木梨貴明','kinashi@gizumo.jp',5,54,1);

INSERT INTO reports (person_id,content)
VALUES
(7,'日報登録2024年8月31日'),
(8,'今日は会社の情報修正をした'),
(9,'今日は浜田に新人研修を行った'),
(10,'今日はフジテレビまで出張にいった'),
(11,'今日はテレ朝で仕事をし、12時までに終わらせた'),
(12,'今日は病院で健康診断をした'),
(13,'今日は岩槻でソフトボールした'),
(14,'今日は埼玉スタジアムで、スポーツ観戦した'),
(15,'今日はスタジオでリハーサルをした'),
(16,'今日は渋谷で説明会をした');

Q4
UPDATE people SET department_id = 2 WHERE department_id IS NULL;

Q5
SELECT name,age FROM people WHERE gender = 1 ORDER BY age DESC;

Q6
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;
peopleテーブルから名前、メールアドレス、年齢を表示するが、
条件がカラムのdepartment_idが1(営業)だけのレコードを取得し、
レコードが作成された日付が早い順番で並び替えする。

Q7
SELECT name FROM people WHERE age between 20 AND 29 AND gender = 2
UNION
SELECT name FROM people WHERE age between 40 AND 49 AND gender = 1;

Q8
SELECT name FROM people WHERE department_id = 1 ORDER BY age ASC;

Q9
SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2;

Q10
SELECT people.name,people.department_id,reports.content FROM people INNER JOIN reports ON
people.person_id = reports.person_id;

Q11
SELECT name FROM people LEFT OUTER JOIN reports ON
(people.person_id = reports.person_id) WHERE reports.content IS NULL;