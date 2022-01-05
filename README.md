# aws-iam-policies

```yaml
cat <<EOF | kubectl apply -f -
apiVersion: source.toolkit.fluxcd.io/v1beta1
kind: GitRepository
metadata:
  name: aws-iam-policies
  namespace: flux-system
spec:
  interval: 30s
  url: https://github.com/tf-controller/aws-iam-policies
  ref:
    branch: main
EOF

```
