# Drift Check GitHub Action

This action runs `drift` to check for documentation drift in your repository.

## Usage

### With Gemini

```yaml
- name: Drift Check (Gemini)
  uses: driftee-ai/drift-action@v1
  with:
    gemini-api-key: ${{ secrets.GEMINI_API_KEY }}
```

### With OpenAI

```yaml
- name: Drift Check (OpenAI)
  uses: driftee-ai/drift-action@v1
  with:
    openai-api-key: ${{ secrets.OPENAI_API_KEY }}
```

## Inputs

- `version`: Version of Drift CLI to use. Defaults to `v0.1.1`.
- `config`: Path to the `.drift.yaml` config file. Defaults to `.drift.yaml`.
- `changed-files`: A comma-separated list of changed files to check.
- `gemini-api-key`: API key for the Gemini provider.
- `openai-api-key`: API key for the OpenAI provider.

**Note:** You must provide an API key for the provider specified in your `.drift.yaml` file.