# Hello K3s Application

A simple "Hello K3s" frontend application managed by ArgoCD.

## Structure

```
hello-k3s-app/
├── src/
│   └── index.html          # Frontend HTML/CSS
├── manifests/
│   ├── configmap.yaml      # Stores the HTML content
│   ├── deployment.yaml     # Kubernetes Deployment
│   ├── service.yaml        # Kubernetes Service
│   ├── ingress.yaml        # Kubernetes Ingress
│   └── kustomization.yaml  # Kustomize config
├── Dockerfile              # Optional: for containerized version
├── argocd-application.yaml # ArgoCD Application manifest
└── README.md              # This file
```

## Setup

### Option 1: Direct Apply (for testing)

```bash
kubectl apply -f manifests/
```

### Option 2: ArgoCD Management

1. **Push to Git repository** (if not already done):
   ```bash
   git init
   git add .
   git commit -m "Add hello-k3s app"
   git remote add origin <your-git-repo>
   git push -u origin main
   ```

2. **Update the ArgoCD Application manifest**:
   - Edit `argocd-application.yaml`
   - Update `repoURL` to point to your Git repository
   - Adjust `path` if needed

3. **Apply the ArgoCD Application**:
   ```bash
   kubectl apply -f argocd-application.yaml
   ```

4. **Access the application**:
   - URL: `https://hello.grimbergenv.nl`
   - Ensure DNS points `hello.grimbergenv.nl` to your ingress IP

## Customization

- **Change the HTML**: Edit `src/index.html` or update the ConfigMap in `manifests/configmap.yaml`
- **Change the domain**: Update `hello.grimbergenv.nl` in `manifests/ingress.yaml` and DNS settings
- **Scaling**: Adjust `replicas` in `manifests/deployment.yaml`

## Notes

- The app uses a ConfigMap to store HTML (simpler than building a Docker image)
- If you want to use a custom Docker image, update `deployment.yaml` to use your image instead
- Make sure cert-manager is configured for automatic TLS certificates


