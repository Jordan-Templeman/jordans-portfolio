type FieldErrors = { description: string[]; title: string[] };

export interface Errors {
  errors: FieldErrors;
  full_messages: string;
}
