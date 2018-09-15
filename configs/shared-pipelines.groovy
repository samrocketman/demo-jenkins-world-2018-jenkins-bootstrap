pipeline_shared_libraries = [
    'Jenkins World Demo pipeline': [
        'defaultVersion': 'master',
        'implicit': true,
        'allowVersionOverride': false,
        'includeInChangesets': true,
        'scm': [
            'remote': 'https://github.com/samrocketman/demo-jenkins-world-2018-jenkins-bootstrap.git',
            'credentialsId': 'clone-https'
        ]
    ],
    'Jervis shared pipeline': [
        'defaultVersion': 'aa5a6d92357a1284e277113b5c7b849a04c71251',
        'implicit': true,
        'allowVersionOverride': false,
        'includeInChangesets': true,
        'scm': [
            'remote': 'https://github.com/samrocketman/jervis.git',
            'credentialsId': 'clone-https'
        ]
    ]
]
