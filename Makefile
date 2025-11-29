.PHONY: release

# Usage: make release version=v1.0.1
release:
	@if [ -z "$(version)" ]; then \
		echo "Error: version is not set. Usage: make release version=v1.0.1"; \
		exit 1; \
	fi
	@if [[ ! "$(version)" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then \
		echo "Error: version must be in format vX.Y.Z (e.g., v1.0.1)"; \
		exit 1; \
	fi
	@echo "Releasing version $(version)..."
	
	# 1. Create the specific tag
	git tag -a $(version) -m "Release $(version)"
	
	# 2. Update the major tag (floating tag)
	@MAJOR_VERSION=$$(echo $(version) | cut -d. -f1); \
	echo "Updating major tag $$MAJOR_VERSION to point to $(version)..."; \
	git tag -f $$MAJOR_VERSION $(version)
	
	# 3. Push everything
	git push origin main
	git push origin $(version)
	@MAJOR_VERSION=$$(echo $(version) | cut -d. -f1); \
	git push -f origin $$MAJOR_VERSION
	
	@echo "Successfully released $(version) and updated major tag $$MAJOR_VERSION"
