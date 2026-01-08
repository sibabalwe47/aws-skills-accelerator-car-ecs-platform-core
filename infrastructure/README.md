
aws-skills-accelerator-platform/
  README.md
  LICENSE
  .gitignore

  docs/
    architecture/
      context.md
      diagrams/
        week-1.png
        week-2.png
        week-3.png
        week-4.png
    runbooks/
      troubleshooting.md
      teardown.md
      common-errors.md

  infrastructure/
    root/
      README.md
      main.tf
      variables.tf
      locals.tf
      outputs.tf
      versions.tf
      providers.tf

    envs/
      dev/
        README.md
        backend.tf
        terraform.tfvars
        main.tf
      prod/
        README.md
        backend.tf
        terraform.tfvars
        main.tf

    modules/
      bootstrap/
        README.md
        versions.tf
        providers.tf
        outputs.tf

      identity/
        README.md
        main.tf
        variables.tf
        outputs.tf

      networking/
        README.md
        main.tf
        variables.tf
        outputs.tf

        subnets.tf
        routes.tf
        nat.tf
        endpoints.tf
        security-groups.tf

      dns/
        README.md
        main.tf
        variables.tf
        outputs.tf

        route53.tf

      edge/
        README.md
        main.tf
        variables.tf
        outputs.tf

        acm.tf
        cloudfront.tf
        waf.tf

      registry/
        README.md
        main.tf
        variables.tf
        outputs.tf

        ecr.tf

      compute/
        README.md
        main.tf
        variables.tf
        outputs.tf

        ecs-cluster.tf
        capacity-providers.tf
        asg.tf
        launch-template.tf

      loadbalancing/
        README.md
        main.tf
        variables.tf
        outputs.tf

        alb-public.tf
        alb-internal.tf
        target-groups.tf
        listeners.tf

      services/
        README.md
        main.tf
        variables.tf
        outputs.tf

        service-website.tf
        service-api.tf
        service-crm.tf
        service-cms.tf
        service-dealership.tf

      data/
        README.md
        main.tf
        variables.tf
        outputs.tf

        rds.tf
        redis.tf
        s3.tf

      observability/
        README.md
        main.tf
        variables.tf
        outputs.tf

        cloudwatch-logs.tf
        alarms.tf
        dashboards.tf

      security/
        README.md
        main.tf
        variables.tf
        outputs.tf

        kms.tf
        iam.tf
        secrets.tf
        ssm.tf
