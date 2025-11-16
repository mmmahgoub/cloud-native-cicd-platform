# Cloud-Native CI/CD Platform

This project demonstrates a **production-style CI/CD pipeline** for a containerized Python web service deployed on **Kubernetes** using **Terraform**, **GitHub Actions**, **Docker**, and **Helm**, with basic monitoring using **Prometheus** and **Grafana**.

---

##  Tech Stack

- **Language**: Python (FastAPI / Flask-style app)
- **Containerization**: Docker
- **Orchestration**: Kubernetes
- **IaC**: Terraform (provisioning Kubernetes cluster + networking)
- **CI/CD**: GitHub Actions
- **Packaging**: Helm chart
- **Monitoring**: Prometheus & Grafana (via Helm values)

---

##  Architecture Overview

1. Simple Python API (`/health`, `/info`).
2. Docker image built and pushed from GitHub Actions to a container registry (e.g. GitHub Container Registry).
3. Terraform used to provision a managed Kubernetes cluster (EKS/GKE/AKS – cloud agnostic structure).
4. Helm chart used to deploy the app to Kubernetes (`dev` and `prod` namespaces).
5. Prometheus and Grafana installed via Helm with basic scrape configs.

---

##  CI/CD Flow

1. **On Push / PR to `main`**:
   - Run Python unit tests.
   - Run linting (optional).
   - Build Docker image with Git commit SHA tag.
   - Scan image (placeholder step).
   - Push image to container registry.

2. **On Tag / Release**:
   - Update Helm chart image tag.
   - Deploy to Kubernetes (`dev`).
   - Optional manual approval to promote to `prod`.

See [`.github/workflows/ci-cd.yaml`](.github/workflows/ci-cd.yaml) for full pipeline.

---

## Running Locally

```bash
cd app
pip install -r requirements.txt
uvicorn main:app --reload --host 0.0.0.0 --port 8000
