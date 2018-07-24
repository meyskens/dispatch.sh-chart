{{/* vim: set filetype=mustache: */}}
{{- define "dispatch.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "dispatch.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "dispatch.labels" -}}
app: {{ template "dispatch.name" . }}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}

{{- define "dispatch.selector" -}}
app: {{ template "dispatch.name" . }}
release: {{ .Release.Name }}
{{- end -}}