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
        'defaultVersion': '7989236b92f466b18a2a816560b3729fd16c7f9a',
        'implicit': true,
        'allowVersionOverride': false,
        'includeInChangesets': true,
        'scm': [
            'remote': 'https://github.com/samrocketman/jervis.git',
            'credentialsId': 'clone-https'
        ]
    ]
]
