const router = require('express').Router();
const mysql = require('../Database/mysql');
const fcm = require('../Support/fcm');
const util = require('util');

setInterval(() => {
    const date = new Date().toISOString().replace(/T/, ' ').replace(/\..+/, '').split(" ")[0];
    mysql.query('SELECT owner, title FROM idea WHERE develop_end_date=?', [date], (err, rows) => {
        for (idx in rows) {
            let row = rows[idx];
            mysql.query('SELECT registration_id FROM account WHERE access_token=?', [row.owner], (err, accountRows) => {
                let ideaTitle = row.title;
                let registrationId = accountRows[0].registration_id;
                fcm.fcm(registrationId, `'${ideaTitle}' 아이디어의 개발 종료일`, '프로젝트를 완료하고 팀원을 평가해주세요!');
            });
        }
    });
}, 1000 * 3600 * 24);

router.route('/idea').post((req, res) => {
    // 아이디어 추가
    let client = req.body.access_token;
    let title = req.body.title;
    let summary = req.body.summary;
    let platform = req.body.platform;
    let purpose = req.body.purpose;
    let detail = req.body.detail;
    let startDate = req.body.start_date;
    let endDate = req.body.end_date;
    let teamMaxCount = req.body.team_max_count;
    let teamDesire = req.body.team_desire;

    mysql.query('INSERT INTO idea(owner, title, summary, platform, purpose, detail, develop_start_date, develop_end_date, team_max_count, team_desire', [
        client,
        title,
        summary,
        platform,
        purpose,
        detail,
        startDate,
        endDate,
        teamMaxCount,
        teamDesire
    ]);
}).get((req, res) => {
    // 아이디어 리스트 가져오기, 플랫폼, 좋아요순 정렬
    let platform = JSON.parse(req.query.platform);
    // ['', '']

    let filteredIdeas = new Array();
    let ideaCount = 0;

    mysql.query('SELECT * FROM idea', (err, rows) => {
        for (idx in rows) {
            let idea = rows[idx];
            let platforms = JSON.parse(idea.platform);
            for (let i = 0; i < platforms.length; i++) {
                for (let j = 0; j < platform.length; j++) {
                    if (platforms[i] == platform[j]) {
                        filteredIdeas[ideaCount++] = {
                            title: idea.title
                        };
                    }
                }
            }
        }

        res.json(filteredIdeas);
    });
}).delete((req, res) => {
    // 아이디어 삭제
});

router.route('/idea/detail').get((req, res) => {
    // 아이디어 세부 정보
});

router.route('/idea/complete').post((req, res) => {
    // 프로젝트 완료
});

module.exports = router;